<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="at.ac.tuwien.big.we15.lab2.api.Question"%>
<%@page import="at.ac.tuwien.big.we15.lab2.api.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="at.ac.tuwien.big.we15.lab2.servlet.BigJeopardyServlet"%>
<%@ page import="java.util.List"%>



<html xmlns="http://www.w3.org/1999/jsp" xml:lang="de" lang="de">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Business Informatics Group Jeopardy! - Fragenauswahl</title>
<link rel="stylesheet" type="text/css" href="style/base.css" />
<link rel="stylesheet" type="text/css" href="style/screen.css" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/framework.js" type="text/javascript"></script>
</head>
<body id="selection-page">
	<a class="accessibility" href="#question-selection">Zur
		Fragenauswahl springen</a>
	<!-- Header -->
	<header role="banner" aria-labelledby="bannerheading">
	<h1 id="bannerheading">
		<span class="accessibility">Business Informatics Group </span><span
			class="gametitle">Jeopardy!</span>
	</h1>
	</header>

	<!-- Navigation -->
	<nav role="navigation" aria-labelledby="navheading">
	<h2 id="navheading" class="accessibility">Navigation</h2>
	<ul>
		<li><a class="orangelink navigationlink" id="logoutlink"
			title="Klicke hier um dich abzumelden" href="login.jsp" accesskey="l">Abmelden</a></li>
	</ul>
	</nav>

	<!-- Content -->
	<div role="main">
		<!-- info -->
		<section id="gameinfo" aria-labelledby="gameinfoinfoheading">
		<h2 id="gameinfoinfoheading" class="accessibility">Spielinformationen</h2>
		<section id="firstplayer" class="playerinfo leader"
			aria-labelledby="firstplayerheading">
		<h3 id="firstplayerheading" class="accessibility">Führender
			Spieler</h3>
		<img class="avatar" src="img/avatar/black-widow_head.png"
			alt="Spieler-Avatar Black Widow" />
		<table>
			<tr>
				<th class="accessibility">Spielername</th>
				<td class="playername">Black Widow (Du)</td>
			</tr>
			<tr>
				<th class="accessibility">Spielerpunkte</th>
				<td class="playerpoints">2000 €</td>
			</tr>
		</table>
		</section> <section id="secondplayer" class="playerinfo"
			aria-labelledby="secondplayerheading">
		<h3 id="secondplayerheading" class="accessibility">Zweiter
			Spieler</h3>
		<img class="avatar" src="img/avatar/deadpool_head.png"
			alt="Spieler-Avatar Deadpool" />
		<table>
			<tr>
				<th class="accessibility">Spielername</th>
				<td class="playername">Deadpool</td>
			</tr>
			<tr>
				<th class="accessibility">Spielerpunkte</th>
				<td class="playerpoints">400 €</td>
			</tr>
		</table>
		</section>
		<p id="round">Fragen: 2 / 10</p>
		</section>

		<!-- Question -->
		<section id="question-selection" aria-labelledby="questionheading">
		<h2 id="questionheading" class="black accessibility">Jeopardy</h2>
		<p class="user-info positive-change">Du hast richtig geantwortet:
			+1000 €</p>
		<p class="user-info negative-change">Deadpool hat falsch
			geantwortet: -500 €</p>
		<p class="user-info">Deadpool hat TUWIEN für € 1000 gewählt.</p>
		<form id="questionform" action="BigJeopardyServlet" method="post">
			<fieldset>
				<legend class="accessibility">Fragenauswahl</legend>

				<% int i = 0; List<Category> info = (List<Category>) request.getAttribute("information");

				// print the information about every category of the list
					for(Category category : info) {%>
 
 				<section class="questioncategory" aria-labelledby="<%out.print(category.getName()); %>heading">
                  <h3 id="<%out.print(category.getName()); %>heading" class="tile category-title"><span class="accessibility">Kategorie: </span><% out.print(category.getName()); %></h3>
                  <ol class="category_questions">
                  <%  for(Question q : category.getQuestions()){ %>
                     <li><input name="question_selection" id="question_<% out.print(i);%>"  value="<%q.getValue(); %>" type="radio" />
                     <label class="tile clickable" for="question_<%out.print(i); %>"><% out.println("€ " +q.getValue()); %></label></li>
                 	
                    <%i++;}%>
                  </ol>
               </section>
 
<%}%>




			</fieldset>
			<input class="greenlink formlink clickable" name="question_submit"
				id="next" type="submit" value="wählen" accesskey="s" />
		</form>
		</section>

		<section id="lastgame" aria-labelledby="lastgameheading">
		<h2 id="lastgameheading" class="accessibility">Letztes Spielinfo</h2>
		<p>Letztes Spiel: Nie</p>
		</section>
	</div>

	<!-- footer -->
	<footer role="contentinfo">© 2015 BIG Jeopardy!</footer>

	<script type="text/javascript">
            //<![CDATA[
            
            // initialize time
            $(document).ready(function() {
                // set last game
                if(supportsLocalStorage()) {
	                var lastGameMillis = parseInt(localStorage['lastGame'])
	                if(!isNaN(parseInt(localStorage['lastGame']))){
	                    var lastGame = new Date(lastGameMillis);
	                	$("#lastgame p").replaceWith('<p>Letztes Spiel: <time datetime="'
	                			+ lastGame.toUTCString()
	                			+ '">'
	                			+ lastGame.toLocaleString()
	                			+ '</time></p>')
	                }
            	}
            });            
            //]]>
        </script>
</body>
</html>