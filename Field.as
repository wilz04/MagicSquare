class Field {
	
	private var field: Array;
	
	private var s: Array;
	
	public function Field() {
		field = new Array(16);
		s = new Array("one", "two", "tree", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen");
		var i:Number;
		for (i=0; i<16; i++) {
			field[i] = null;
		}
	}
	
	public function addPiece(mc:MovieClip): Number {
		var n:Number;
		n = random(16);
		if (field[n] == null) {
			field[n] = mc;
		} else {
			while (field[n] != null) {
				n++;
				if (n == 16) {
					n = 0;
				}
			}
			field[n] = mc;
		}
		return n;
	}
	
	function getN(x:Number, y:Number):Number {
		var n: Number;
		x /= 50;
		y /= 50;
		x++;
		y++;
		n = (y-1)*4+x;
		n--;
		return n;
	}
	
	public function setPiece(mc:MovieClip, x:Number, y:Number): Boolean {
		if (field[getN(mc._x, mc._y)] == null) {
			field[getN(mc._x, mc._y)] = mc;
			field[getN(x, y)] = null;
			return true;
		} else {
			return false;
		}
	}
	
	public function showField() {
		var i: Number;
		for (i=0; i<16; i++) {
			trace(i+": "+field[i]._name);
		}
	}
	
	public function isDone(): Boolean {
		var success:Boolean;
		success = true;
		var i:Number;
		for (i=0; i<15; i++) {
			if (field[i]._name != s[i]) {
				success = false;
				break;
			}
		}
		return success;
	}
	
}
