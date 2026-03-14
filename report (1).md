# 📊 Movies Data Analysis — Findings Report

**Dataset:** 4000+ movies from 1980 to 2001  
**Tool:** MySQL Workbench  
**Author:** Krish Rathore — Aspiring Data Scientist

---

## Overview

This report documents the key findings from a SQL analysis of Hollywood movies spanning two decades — from 1980 to 2001. The dataset includes box office revenue, IMDb scores, budgets, directors, genres and studios. The goal was to find patterns that answer real business questions a studio executive or analyst would actually care about.

---

## Q1 — Box Office Kings

Titanic (1997) was the single highest grossing movie in the entire dataset. What makes this remarkable is that it was a Drama — not an Action or Adventure film. It grossed more than most franchises combined. The top 10 highest grossing movies were dominated by sequels and franchise films like Star Wars, Indiana Jones and Jurassic Park — proving that audiences in this era rewarded familiar stories over original ones.

**Key Finding:** The highest grossing movie in 20 years of Hollywood was a love story set on a sinking ship.

---

## Q2 — Which Genre Makes the Best Movies?

Drama, Biography and Crime consistently scored the highest on IMDb. Action and Horror — despite being the most produced and most marketed genres — ranked at the bottom for average score. This creates a clear tension: the genres audiences rate most highly are not the ones Hollywood makes the most of.

**Key Finding:** Drama, Biography and Crime are the most critically respected genres. Action and Horror dominate production volume but trail significantly in quality ratings.

---

## Q3 — Hollywood's Most Active Years

1996 and 1997 were the most active years in the dataset with the highest number of movies released. This was the peak of the pre-streaming era — cinema was still the dominant entertainment medium and studios were investing aggressively. Titanic released in 1997 made this the most financially rewarding year as well, making it the single most important year in the entire dataset.

**Key Finding:** 1996 and 1997 represent the peak of Hollywood's pre-digital golden age — maximum output and maximum revenue in the same window.

---

## Q4 — The Best Movie in Every Genre

The Shawshank Redemption topped Drama with one of the highest IMDb scores ever recorded. Lord of the Rings led its genre as well. What stands out is that the top rated movie in almost every genre was a film with a strong human story at its core — even in genres like Action and Adventure, the highest rated films were character driven rather than spectacle driven.

**Key Finding:** Across every genre, the highest rated film had one thing in common — a strong human story.

---

## Q5 — Profit vs Hype

Many of the most talked about movies were not the most profitable. When filtering only for movies where gross exceeded budget, smaller films with modest budgets appeared at the top of the profit list. Studios that spent less and earned more were the real winners — not the blockbusters with $100M+ budgets.

**Key Finding:** Profitability and fame are not the same thing. Many quiet, mid-budget films outperformed big franchise releases in pure ROI terms.

---

## Q6 — The Most Valuable Directors

Steven Spielberg came out on top as the most commercially successful director in the dataset — with the highest total gross across multiple films and a consistently strong average score. What separates Spielberg from other high-grossing directors is that he achieved both critical respect and commercial dominance simultaneously — a combination almost no other director in this dataset managed at the same scale.

**Key Finding:** Steven Spielberg is the only director in this dataset who consistently achieved both critical acclaim and massive commercial success across two decades.

---

## Q7 — Hollywood's Biggest Mistakes

The 13th Warrior was the biggest budget flop in the entire dataset — a film that cost an enormous amount to produce and earned a fraction of that back at the box office. The flops in this dataset share a pattern: large budgets, weak scripts and overconfidence from studios who assumed money alone would drive audiences to theaters.

**Key Finding:** The 13th Warrior tops the list of Hollywood's most expensive failures — a reminder that no budget can fix a weak story.

---

## Q8 — Where Should Studios Invest?

The ROI analysis by genre reveals that Horror is actually one of the smartest investments in Hollywood — low production budgets combined with reliable audience turnout means Horror consistently delivers strong returns even when individual films score poorly on IMDb. Animation also showed strong ROI driven by family audiences and merchandising. Action despite its popularity had surprisingly average ROI due to bloated production costs.

**Key Finding:** Horror is Hollywood's most financially efficient genre — cheap to make, reliable to sell, and almost impossible to lose money on when done competently.

---

## Q9 — Rankings Within Genres

When movies are ranked within their own genre using SQL window functions, a clearer picture emerges of which films truly dominated their category. The top 5 in each genre shows how unequal the distribution of quality is — in most genres the top 1-2 films score dramatically higher than the rest of the field.

**Key Finding:** In almost every genre, quality is concentrated at the very top. The gap between rank 1 and rank 5 within a genre is often larger than the gap between genres themselves.

---

## Q10 — Box Office Dominance by Genre

The top 3 grossing movies in each genre reveal which films owned their category commercially. Franchise films dominated Action and Adventure. Family films dominated Animation. What is striking is that in genres like Drama and Biography — where budgets are typically lower — the top grossing films still earned hundreds of millions, suggesting that audiences will show up for quality regardless of genre.

**Key Finding:** Commercial dominance within a genre is not about budget — it is about delivering exactly what that genre's audience came to see.

---

## Final Takeaway

Two decades of Hollywood data tell one consistent story: **the movies that lasted were the ones with something real to say.** The highest scored, most profitable and most remembered films in this dataset were not the ones with the biggest budgets — they were the ones with the strongest stories.

---

*Analysis performed using MySQL Workbench. All figures based on available budget and gross data in the dataset. Movies with missing budget or gross values were excluded from financial calculations.*
