# ChickenNuggets

## Maggie Zhao, Bing Li, Kenny Li

## APCS2 Final Project

### Description of Our Project
You opened up a new restaurant on Broadway and a lot of customers have come to try out your food. Every customer has a different order and you are responsible for serving your customers before they leave! You can do this by clicking on the customer to display their order and time limit, then click on the desired ingredients in the kitchen to make the food and serve it to the customers. If you have successfully served the customers before time is up, you will get a generous tip that you can use to upgrade your store with new cooking equipment. Otherwise, you will receive a punishment. Once you have $1000 tips and the number of customers who left your store is less than 10, you win and may proceed to the next level!

### Rules
* Customers are served with a priority queue- you have to serve the customers that come in first, but any “special” customers that come in will shove to the front of the line.
* Must serve within time limit
  * If completed the goal, you will get a tip from the customer
  * If you fail to provide the service, you will lose money, and several other customers will leave the store as well. 
  * If any food is burnt (or contains the wrong ingredient), you get a smaller amount of tips
  * If you have enough tips, you can buy new equipments in the store that will make the cooking process more efficient.
* Win condition: successfully served everything to certain number of customers (<10 who left) and gain $1000, game ends. Otherwise, keep going until the win condition is reached

### Launch Instructions
1. Clone our repo
2. Go to ChickenNuggets/Driver/ and click on Driver.pde
3. Press the play icon on the top left corner
4. Click on the first customer to start the game

Proposal: [Our proposal](./docs/proposal.pdf)
