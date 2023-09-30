// options1.cairo
// Execute `starklings hint options1` or use the `hint` watch subcommand for a hint.



use option::OptionTrait;


// This function returns how much icecream there is left in the fridge.
// If it's before 10PM, there's 5 pieces left. At 10PM, someone eats them
// all, so there'll be no more left :(
fn maybe_icecream(
    time_of_day: usize
) -> Option<usize> { 
    let am_check: usize = 12;
    let max_time: usize = 24;
    let no_creame: usize = 10;

    if time_of_day < max_time {
        if time_of_day > am_check {
            if time_of_day - am_check >= no_creame {
                return Option::Some(0);
            }
            return Option::Some(5);
        }
        return Option::Some(5);
    }

    Option::None
}



#[test]
fn check_icecream() {
    assert(maybe_icecream(9).unwrap() == 5, 'err_1');
    assert(maybe_icecream(10).unwrap() == 5, 'err_2');
    assert(maybe_icecream(23).unwrap() == 0, 'err_3');
    assert(maybe_icecream(22).unwrap() == 0, 'err_4');
    assert(maybe_icecream(25).is_none(), 'err_5');
}

#[test]
fn raw_value() {
    // TODO: Fix this test. How do you get at the value contained in the Option?
    let icecreams = maybe_icecream(12).unwrap();
    assert(icecreams == 5, 'err_6');
}
