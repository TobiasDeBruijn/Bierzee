use std::{fs, io};
use std::io::Result;
use std::path::{Path, PathBuf};

fn main() -> Result<()> {
    let mut config = prost_build::Config::new();
    config.type_attribute(".", "#[derive(serde::Serialize, serde::Deserialize)]");

    let proto_files = discover("src/")?;
    let stringified_paths = proto_files.into_iter()
        .map(|x| x.to_string_lossy().to_string())
        .collect::<Vec<_>>();

    config.compile_protos(&stringified_paths, &["src/"])?;

    Ok(())
}

fn discover<P: AsRef<Path>>(dir: P) -> io::Result<Vec<PathBuf>> {
    let mut dirs = Vec::new();
    let dir = fs::read_dir(dir)?;

    for entry in dir {
        let entry = entry?;
        let path = entry.path();

        if path.is_dir() {
            dirs.append(&mut discover(&path)?);
        } else {
            if let Some(ext) = path.extension() {
                if ext.eq("proto") {
                    println!("cargo:rerun-if-changed={}", path.to_string_lossy());
                    dirs.push(path);
                }
            }
        }
    }

    Ok(dirs)
}