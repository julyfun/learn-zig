const fn one(value: i32) -> i32 {
    value + 1
}

const fn two(value: i32) -> i32 {
    value + 2
}

const fn three(value: i32) -> i32 {
    value + 3
}

struct CmdFn {
    name: &'static str,
    func: fn(i32) -> i32,
}

const CMD_FNS: [CmdFn; 3] = [
    CmdFn {
        name: "one",
        func: one,
    },
    CmdFn {
        name: "two",
        func: two,
    },
    CmdFn {
        name: "three",
        func: three,
    },
];

const fn perform_fn(prefix_char: char, start_value: i32) -> i32 {
    let mut result = start_value;
    let mut i = 0;
    while i < CMD_FNS.len() {
        if CMD_FNS[i].name.starts_with(prefix_char) {
            result = (CMD_FNS[i].func)(result);
        }
        i += 1;
    }
    result
}

fn main() {
    assert_eq!(perform_fn('t', 1), 6);
    assert_eq!(perform_fn('o', 0), 1);
    assert_eq!(perform_fn('w', 99), 99);
}
