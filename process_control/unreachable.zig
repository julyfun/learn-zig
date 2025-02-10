test "unreachable" {
    const x = 1;
    var y: i32 = 2;
    y = 3;
    if (x + y != 3) {
        unreachable;
    }
}
