#  Pandoré  
*(Contraction de Pandore et les notes Do & Ré)*  

##  Description du projet
**Pandoré** est une **banque de musique en ligne** avec un principe simple :  
L’utilisateur utilise une **invite vocale ou textuelle** pour rechercher un titre.  

- Si le titre est trouvé → il est affiché directement.  
- Si une correspondance approximative existe → plusieurs titres proches sont proposés.  
- Si le titre est introuvable → l’utilisateur peut le **suggérer** afin qu’il soit ajouté ultérieurement par le gérant du site.  

##  Technologies utilisées
- **Frontend** : HTML, CSS, JavaScript  
- **Backend** : PHP  
- **Base de données** : MySQL  
- **Échange de données** : JSON / XML  
- **Omeka S** : pour la gestion et la récupération des fichiers audio  
- **Hébergement & versioning** : GitHub  

##  Fonctionnalités principales
- Recherche vocale ou textuelle d’un titre  
- Affichage des résultats exacts ou proches  
- Suggestion de nouveaux titres par les utilisateurs  
- Gestion et validation des titres par l’administrateur  

##  Modèle de données : Diagramme Entité-Relation
Voici l’ERD (Entité-Relation) du projet Pandoré :  

```mermaid
erDiagram
    UTILISATEUR {
        int idUtilisateur PK
        string nom
        string email
        string role
    }

    TITRE {
        int idTitre PK
        string nomTitre
        string artiste
        int annee
        string fichierAudio
    }

    RECHERCHE {
        int idRecherche PK
        string motCle
        date dateRecherche
    }

    SUGGESTION {
        int idSuggestion PK
        string nomTitrePropose
        string statut
    }

    UTILISATEUR ||--o{ RECHERCHE : "effectue"
    UTILISATEUR ||--o{ SUGGESTION : "propose"
    RECHERCHE }o--|| TITRE : "correspond à"
    SUGGESTION }o--|| TITRE : "peut devenir"
