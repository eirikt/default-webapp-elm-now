console.info('[Default Webapp] Initializing...');

console.log('[Default Webapp] Version: ' + VERSION);
console.log('[Default Webapp] Build timestamp: ' + TIMESTAMP);
console.log('[Default Webapp] Build mode: ' + MODE);

console.log('[Default Webapp] Replacing the \'elmContainer\' element with the Elm runtime containing the Default Webapp application...');
const app = require('./elm/Main.elm');
app.Elm.Main.init({
    node: document.getElementById('elmContainer'),
    flags: {
        "version": VERSION,
        "timestamp": TIMESTAMP,
        "mode": MODE
    }
});
