// Object to pass the console.log() function to the WASM module
const imports = {
    console: {
        log: x => console.log("WASM log:", x)
    }
};

// Load WASM addition module using fetch, and run the example code
WebAssembly.instantiateStreaming(fetch("main.wasm"), imports).then(
    (obj) => {
        // Save the answer to the ans variable and print result from the JS side
        ans = obj.instance.exports.add(10, 100);
        console.log("JS log: ", ans);
        // Also put add() in a variable for easy console access
        add = obj.instance.exports.add;
    }
);
