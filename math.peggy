Expression
  = head:Term tail:(Whitespace ("+" / "-") Whitespace Term)* {
      /* : number */
      return tail.reduce(
        function(result, element) {
          if (element[1] === "+") { return result + element[3]; }
          else { return result - element[3]; }
        },
        head
      );
    }

Term
  = head:Factor tail:(Whitespace ("*" / "/") Whitespace Factor)* {
      /* : number */
      return tail.reduce(
        function(result, element) {
          if (element[1] === "*") { return result * element[3]; }
          else { return result / element[3]; }
        },
        head
      );
    }

Factor
  = "(" Whitespace @Expression Whitespace ")"
  / Integer

Integer
  = Whitespace number:$([0-9]+) { return parseInt(number, 10); }

Whitespace
  = [ \\t\\n\\r]*
