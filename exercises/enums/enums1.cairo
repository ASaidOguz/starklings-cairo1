// enums1.cairo
// No hints this time! ;)



//Enums, short for "enumerations," are a way to define a custom data type that consists 
//of a fixed set of named values, called variants. Enums are useful for representing a 
//collection of related values where each value is distinct and has a specific meaning.

use debug::print;
use debug::PrintTrait;

enum Message { // TODO: define a few types of messages as used below
    Quit,
    Echo,
    Move,
    ChangeColor,
}

fn main() {
    Message::Quit(()).print();
    Message::Echo(()).print();
    Message::Move(()).print();
    Message::ChangeColor(()).print();
}

impl MessagePrintImpl of PrintTrait<Message> {
    fn print(self: Message) {
        match self {
            Message::Quit(()) => ('Quit').print(),
            Message::Echo(()) => ('Echo').print(),
            Message::Move(()) => ('Move').print(),
            Message::ChangeColor(()) => ('ChangeColor').print()
        }
    }
}
