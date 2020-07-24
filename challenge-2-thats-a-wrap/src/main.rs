use std::{fs, path::Path};

fn main() {
    let text = read_challenge_data();
    let lines = wrap_into_lines(&text[..]);
    let result = count_full_lines(&lines);

    println!("{}", result);
}

fn read_challenge_data() -> String {
    let file_path = Path::new("./data/data.txt");
    let challenge_data = fs::read_to_string(&file_path)
        .expect("Failed to read challenge data file");
    
    String::from(challenge_data.trim_end())
}

fn wrap_into_lines(text: &str) -> Vec<&str> {
    let mut lines: Vec<&str> = vec!();
    let mut remaining_text = &text[..];
    
    while remaining_text.len() > 32 {
        if let Some(i) = &remaining_text[..32].rfind(|ch| ch == ' ' || ch == '-') {
            lines.push(&remaining_text[..(*i + 1)]);
            remaining_text = &remaining_text[(*i + 1)..];
        } else {
            panic!("Encountered a token which exceeds maximum line length");
        }
    }
    lines.push(remaining_text);
    
    lines
}

fn count_full_lines(lines: &Vec<&str>) -> usize {
    lines.iter().filter(|line| line.len() == 32).count()
}
