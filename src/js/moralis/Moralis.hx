package js.moralis;

import js.lib.Map;
import js.lib.Promise;

extern interface User {
	@:overload(function():js.lib.Map<String, String> {})
	public function current():js.lib.Map<String, String>;

	@:overload(function():Promise<Void> {})
	public function logOut():Promise<Void>;
}

@:native("Moralis")
extern class Moralis {
	@:overload(function(options:ClientOptions):Void {})
	public static function start(options:ClientOptions):Void;

	@:overload(function(options:ClientOptions):Promise<Map<String, String>> {})
	public static function authenticate(options:AuthOptions):Promise<Map<String, String>>;

	public static final User:User;
}

typedef ClientOptions = {
	serverUrl:String,
	appId:String
}

typedef AuthOptions = {
	signingMessage:String
}
