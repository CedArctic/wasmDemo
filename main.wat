(module

    ;; Import the JS console.log() function
    (import "console" "log" (func $log (param i32)))

    ;; Export function for it to be accessible through JS
    (export "add" (func $add))

    ;; Addition function definition
    (func $add (param $arg1 i32) (param $arg2 i32) (result i32) (local $temp i32)
        ;; Load input arguments to the stack, and add them
        (i32.add (local.get $arg1) (local.get $arg2))
        ;; Write answer to $temp
        local.set $temp
        ;; Load answer back into the stack
        local.get $temp
        ;; Call imported console.log() JS function
        call $log
        ;; Load answer to stack again as a return value
        local.get $temp
    )

)
