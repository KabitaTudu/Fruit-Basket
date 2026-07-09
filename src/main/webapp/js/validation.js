const emailPattern = /^[^\s@]+\@[^\s@]+\.[^\s@]+$/;

function validateSignUp() {
	const username = document.getElementById("js-username").value.trim();
	const email = document.getElementById("js-email").value.trim();
	const password = document.getElementById("js-password").value.trim();
	
	if (!username || !email || !password) {
		alert("You must provide a username, an email and a password to sign up.");
		return false;
	}
	if (!email.match(emailPattern)) {
		alert("Enter a valid email address.");
		return false;
	}
	if (password.length < 5 || password.length > 12) {
		alert("Password must be greater than 5 and less than 13 characters long.");
		return false;
	}
	
	return true;
}

function validateSignIn() {
	const username = document.getElementById("js-username").value.trim();
	const password = document.getElementById("js-password").value.trim();
	
	if (!username || !password) {
		alert("You must provide a username and a password to sign in.");
		return false;
	}
	
	return true;
}
