// CALCUL DES PARTS - VRAI-COIN - Version DevSecOps
// Règle : Part = (Apport de la personne / Total) * 100

function calculerParts() {
// 1. On récupère les valeurs, et on les transforme en nombres
const nom1 = document.getElementById("nom1").value.trim();
const nom2 = document.getElementById("nom2").value.trim();
const montant1 = Number(document.getElementById("montant1").value);
const montant2 = Number(document.getElementById("montant2").value);
const resultat = document.getElementById("resultat-parts");

// 2. SÉCURITÉ : On bloque tout ce qui est bizarre
// Pas de nom vide, pas de montant négatif, pas de 0, pas de texte
if (!nom1 || !nom2) {
resultat.textContent = "Erreur : Mets les 2 noms.";
return;
}
if (!Number.isFinite(montant1) || !Number.isFinite(montant2)) {
resultat.textContent = "Erreur : Mets que des chiffres.";
return;
}
if (montant1 <= 0 || montant2 <= 0) {
resultat.textContent = "Erreur : Le montant doit être plus que 0.";
return;
}

// 3. CALCUL
const total = montant1 + montant2;
const part1 = (montant1 / total) * 100;
const part2 = (montant2 / total) * 100;

// 4. VÉRIFICATION DevSecOps : le total doit faire 100%
// Si ce n'est pas 100%, on n'affiche rien, c'est qu'il y a un bug
if (Math.round(part1 + part2) !== 100) {
resultat.textContent = "Erreur système : Total différent de 100%.";
return;
}

// 5. AFFICHAGE SÉCURISÉ avec textContent, jamais de code dangereux
resultat.textContent = nom1 + " : " + part1.toFixed(2) + "% | " + nom2 + " : " + part2.toFixed(2) + "% | Total : " + total + " FCFA";
}
