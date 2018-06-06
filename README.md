# ChickenNuggets

## Maggie Zhao, Bing Li, Kenny Li

## APCS2 Final Project- Kenny's Burger Shoppe 

Proposal: [Our proposal](./docs/proposal.pdf)

### Description of Our Project
You've opened up a new restaurant on Broadway and a lot of customers have come to try out your food. Every customer has a different order, and you are responsible for serving your customers before they leave! You can do this by clicking on the customer to display their order and time limit, and then clicking on the desired ingredients in the kitchen to make the food and serve it to the customers. If you have successfully served the customers before time is up, you will get a generous tip that you can use to upgrade your store with new cooking equipment. Otherwise, you will receive a punishment. Once you have $1000 tips and the number of customers who left your store is less than 10, you win and may proceed to the next level!

### Launch Instructions
1. Clone our repo
2. Go to ChickenNuggets/Driver/ and click on Driver.pde
3. Press the play icon on the top left corner
4. Click on the first customer to start the game

User starts off on main screen, which will show total tips and any customers that enter the store (customers have a 6% chance of coming into the store).

Click on a customer to see their order.
Serve the customer by collecting all the food and placing on the tray, and then on the customer. 
- If served within the time limit, and the order is completely correct, player will receive a tip, and the customer will leave.
- If not served within the time limit, or something in the order is incorrect or burnt, the customer will just leave.

##### Making Food
- For foods that are not cooked, simply place on the tray.
- To cook foods, simply click on the raw food item and click on a stove to place it. Once the food is completely cooked (timer will run out), click on the serving station to place it on the tray. 
- If food is cooked for too long, it will become burnt. Throw it out in the trash can, or risk angering the customers.

###### How Do I Win?
- Win Condition: Earn at least $1000 in tips!
- Lose Condition: Have 10 customers leave the store because of long wait times, incorrect orders, or burnt food.

###### Buying and Upgrading
Next to each piece of equipment, there is a button to upgrade, or buy another.
- Buy- :heavy_dollar_sign: - buys a new piece of equipment (the limit being three of the type).
- Upgrade- :arrow_up: - improves the equipment with a boost to speed of cooking, or increases the amount of tip received.

### tldr; 
* Customers are served with a priority queue- you have to serve the customers that come in first, but any “special” customers that come in will shove to the front of the line.
* Must serve within time limit
  * If completed the goal, you will get a tip from the customer
  * If you fail to provide the service, you will lose money, and several other customers will leave the store as well. 
  * If any food is burnt (or contains the wrong ingredient), you get a smaller amount of tips
  * If you have enough tips, you can buy new equipments in the store that will make the cooking process more efficient.
* Win condition: successfully served everything to certain number of customers (<10 who left) and gain $1000, game ends. Otherwise, keep going until the win condition is reached



