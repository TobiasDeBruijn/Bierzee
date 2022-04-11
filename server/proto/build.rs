use std::fs;
use std::io::Result;

fn main() -> Result<()> {
    let mut config = prost_build::Config::new();
    config.type_attribute(".", "#[derive(serde::Serialize, serde::Deserialize)]");

    let mut files = Vec::new();

    let dir = fs::read_dir("src/")?;
    for f in dir {
        let f = f?;
        let path = f.path();

        if let Some(ext) = path.extension() {
            if ext.ne("proto") {
                continue;
            }
        }

        println!("cargo:rerun-if-changed={}", path.to_string_lossy());
        files.push(path.to_string_lossy().to_string());
    }

    config.compile_protos(&files, &["src/"])?;

    Ok(())
}
