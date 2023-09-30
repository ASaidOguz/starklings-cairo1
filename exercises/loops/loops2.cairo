// loops2.cairo
// Execute `starklings hint loops2` or use the `hint` watch subcommand for a hint.
//first tried break() return counter; however it was obviosuly wrong 
//in hint obviously it resembling wrong implementation.
//so adding the returned value set as argument for break() operation should be 
//correct one


#[test]
#[available_gas(200000)]
fn test_loop() {
    let mut counter = 0;

    let mut result = loop {
        if counter == 5 {
    //TODO return a value from the loop
        break(counter);
        
        }
        counter += 1;
    };

    assert(result == 5, 'result should be 5');
}
