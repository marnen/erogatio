ParameterType name: 'number', regexp: /-?\d+(?:\.\d*)?/, transformer: -> (number) { '.'.in?(number) ? number.to_f : number.to_i }
ParameterType name: 'anything', regexp: /.*/, transformer: -> (string) { string }, use_for_snippets: false
