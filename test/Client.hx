import js.moralis.Moralis;
import js.Browser;
import js.lib.Promise;
import js.lib.Map;

class Client {
	static function main() {
		// Use your own
		Moralis.start({serverUrl: '', appId: ''});

		var metamaskLogin = Browser.document.createButtonElement();
		metamaskLogin.textContent = "Login!";
		metamaskLogin.onclick = function(e) {
			final user = Moralis.User.current();
			if (user == null) {
				Moralis.authenticate({signingMessage: "Log in using Moralis"}).then(function(user:Map<String, String>) {
					trace("Logged in! Eth address:");
					trace(user.get('ethAddress'));
				}).catchError(function(e:Dynamic) {
					trace("Auth error");
				});
			} else {
				trace("Already logged in !");
				trace(user.get('ethAddress'));
			}
		};
		Browser.document.body.appendChild(metamaskLogin);

		var metamaskLogout = Browser.document.createButtonElement();
		metamaskLogout.textContent = "Logout!";
		metamaskLogout.onclick = function(e) {
			Moralis.User.logOut().then(function(Void) {
				trace("Logged out!");
			}).catchError(function(e:Dynamic) {
				trace("Auth error");
			});
		};
		Browser.document.body.appendChild(metamaskLogout);
	}
}
