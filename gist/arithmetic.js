(function(){
	var toNumber = function(a){
		return a * 1;
	}
	var splitFormula = function(formula){
		formula = formula.match(/[\(\)\*\/+-\.\d*?]/g);
		var result = [], v;
		var readIndex = 0;
		while(formula.length){
			v = formula.shift();
			result.push(v);
			if(isLikeNumber(v)){
				while (formula.length && (isLikeNumber(formula[0]) || formula[0] === '.')) {
					result[result.length - 1] += formula.shift();
				}
			}
		}
		return result;
	}
	window.testSplitFormula = function(){
		console.log(splitFormula('3 + 50-(4*2.5)/4'));
	}

	var readerBuilder = function(text){
		var index = 0;
		var arr = splitFormula(text);
		var max = arr.length;
		return {
			next: function(){
				if(index <= max){
					return arr[index++];
				}else{
					return undefined;
				}
			},
			isNextMulOrDiv: function(){
				var oper = arr[index];
				if(oper === '*' || oper === '/'){
					return true;
				}
				return false;
			}
		}
	}
	var isNumber = Number.isFinite;
	var isLikeNumber = function(n){
		return n !== ' ' && isNumber(n * 1);
	};
	var calculate = {
		add: function(a, b){
			return a + b;
		},	
		sub: function(a, b){
			return a - b;
		},
		mul: function(a, b){
			return a * b;
		},
		div: function(a, b){
			return a / b;
		}
	};
	var getValue = function(reader, deep, initialValue){
		var value = reader.next();
		var stop = deep === undefined ? Infinity : deep;
		var result = initialValue === undefined ? 0 : initialValue;
		var action = calculate.add;
		while(value !== undefined){
			stop--;
			switch(value){
				case '+':
					action = calculate.add;
					break;
				case '-':
					action = calculate.sub;
					break;
				case '*':
					action = calculate.mul;
					break;
				case '/':
					action = calculate.div;
					break;
				case '(':
					result = action(result, getValue(reader));
					break;
				case ')':
					return result;
					break;
				default:
					if(isLikeNumber(value)){
						if(reader.isNextMulOrDiv()){
							result = action(result, getValue(reader, 1, toNumber(value)));
						}else{
							result = action(result, toNumber(value));
						}
					}
			}
			if(stop < 0){
				break;
			}
			value = reader.next();
		}
		return result;
	}
	var runFormula = function(formula){
		return getValue(readerBuilder(formula));
	}

	// for test
	var assest = function(formula, result) {
		var v = runFormula(formula);
		if ( v === result) {
			console.log(formula, v, result);
			return true;
		}else{
			console.error(formula, v, result);
			return false;
		}
	}
	window.start = function(){
		assest('1+ 2', 3);
		assest('1.2 +2.3', 3.5);
		
		assest('2 * 3 - 6', 0);
		assest('1 + 2 * 3', 7);
		assest('(1 + 2) * 3', 9);
		assest('3 * (3 + 2)', 15);

		// return
		assest('15 + 2', 17);
		assest('4 + 5 + 2', 11);
		assest('4 - 5 + 2', 1);
		assest('4 - (5 - 2)', 1);
		assest('4 - (5 - 2 - ( 8 - 3))', 6);
	}
})();
