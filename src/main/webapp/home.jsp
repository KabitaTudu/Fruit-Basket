<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="css/home.css">
</head>
<body>
	<script>
		function show() {
			const content = document.getElementById("fruits-available-select");
			const btnToggle = document.getElementById("btn-toggle");
			if (content.style.display == "none") {
				content.style.display = "block";
				btnToggle.textContent = "Hide";
			} else {
				content.style.display = "none";
				btnToggle.textContent = "Show";
			}
		}
	</script>
	<div>
		<h1>All About Fruits</h1>
		<div class="benefits">
			<h3>Benefits</h3>
			<p><i>Fruits are the means by which angiosperms disseminate their seeds. 
			Edible fruits in particular have long propagated using the movements of humans 
			and other animals in a symbiotic relationship that is the means for seed 
			dispersal for the one group and nutrition for the other; humans, and 
			many other animals, have become dependent on fruits as a source of food.
			 Consequently, fruits account for a substantial fraction of the world's 
			 agricultural output, and some (such as the apple and the pomegranate)
			  have acquired extensive cultural and symbolic meanings.</i></p>
		</div>
		<div class="fruits-available" id="fruits-available-select" style="display: none;">
			The outer layer, often edible, of most fruits is called the pericarp. 
			Typically formed from the ovary, it surrounds the seeds; in some species, 
			however, other structural tissues contribute to or form the edible portion. 
			The pericarp may be described in three layers from outer to inner, i.e., the 
			epicarp, mesocarp and endocarp.
			Fruit that bears a prominent pointed terminal projection is said to be beaked.
		</div>
		<button onclick="
			show();
		" id="btn-toggle">Show</button>
		<a href="addFruit.jsp" class="add-link">Add Fruit</a>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>