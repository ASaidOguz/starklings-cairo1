// move_semantics6.cairo
// Execute `starklings hint move_semantics6` or use the `hint` watch subcommand for a hint.
// You can't change anything except adding or removing references.


use debug::PrintTrait;

#[derive(Drop)]
struct Number {
    value: u32, 
}

fn main() {
    let mut number = Number { value: 1111111 };

    get_value(@number);

    set_value(ref number);
}

// Should not take ownership and not modify the variable passed.
fn get_value(number: @Number) -> u32 {
    *number.value
}

// Should take ownership
fn set_value(ref number: Number) {
    let value = 2222222;
    number = Number { value };
    number.value.print();
}
//set_value function using ref instead of snapshot --> explained below
//We can achieve the behavior we want in Listing 4-6 by using a mutable reference instead of a snapshot.
//Mutable references are actually mutable values passed to a function that are implicitly returned at
//the end of the function, returning ownership to the calling context. By doing so, 
//they allow you to mutate the value passed while keeping ownership of it by returning 
//it automatically at the end of the execution.
//In Cairo, a parameter can be passed as mutable reference using the ref modifier.