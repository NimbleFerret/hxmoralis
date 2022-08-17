(function ($global) { "use strict";
var Client = function() { };
Client.main = function() {
	Moralis.start({ serverUrl : "https://pjdqdsfav5ky.usemoralis.com:2053/server", appId : "k1JfXbI31nN8g46veG941hlSsy8YOPB8k9QjKpzy"});
	var serverUrl = "https://pjdqdsfav5ky.usemoralis.com:2053/server";
	var appId = "k1JfXbI31nN8g46veG941hlSsy8YOPB8k9QjKpzy";
	var metamaskLogin = window.document.createElement("button");
	metamaskLogin.textContent = "Login!";
	metamaskLogin.onclick = function(e) {
		var user = Moralis.User.current();
		if(user == null) {
			Moralis.authenticate({ signingMessage : "Log in using Moralis"}).then(function(user) {
				console.log("Client.hx:19:",user.get("ethAddress"));
			}).catch(function(e) {
				console.log("Client.hx:21:","Auth error");
			});
		} else {
			console.log("Client.hx:24:","Already logged in !");
			console.log("Client.hx:25:",user.get("ethAddress"));
		}
	};
	window.document.body.appendChild(metamaskLogin);
	var metamaskLogout = window.document.createElement("button");
	metamaskLogout.textContent = "Logout!";
	metamaskLogout.onclick = function(e) {
		Moralis.User.logOut().then(function(Void1) {
			console.log("Client.hx:34:","Logged out!");
		}).catch(function(e) {
			console.log("Client.hx:36:","Auth error");
		});
	};
	window.document.body.appendChild(metamaskLogout);
};
var haxe_iterators_ArrayIterator = function(array) {
	this.current = 0;
	this.array = array;
};
haxe_iterators_ArrayIterator.prototype = {
	hasNext: function() {
		return this.current < this.array.length;
	}
	,next: function() {
		return this.array[this.current++];
	}
};
Client.main();
})({});
