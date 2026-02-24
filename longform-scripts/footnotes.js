module.exports = {
    description: {
            name: "Prepend scene number to footnotes",
            description: "Prepend scene number to footnotes",
            availableKinds: ["Scene"],
            options: []
    },

compile: async (input, context) => {
for (let i = 0; i < input.length; i++) {
            let text = input[i].contents;
            
            // re-index footnote-definitions
            text = text.replace(/^\[\^(\S+)?]: /gm, function(match, label) {
                    return ('[^' + i + '-' + label + ']: ');
            });
            
            // re-index footnote-keys
            // regex uses hack to treat lookahead as lookaround https://stackoverflow.com/a/43232659
            text = text.replace(/(?!^)\[\^(\S+)?]/gm, function(match, label) {
                    return ('[^' + i + '-' + label + ']');
            });
            
            input[i].contents = text;
    }
    return input;
}
};