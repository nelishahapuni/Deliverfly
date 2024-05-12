# Deliverfly

- Delivery app that fetches a list of restaurants from Firebase.
- When tapping on a restaurant can see a list of food items on the Restaurant view.
- When tapping on an item, you can choose the quantity of the item.
- Some foods can be customized with up to three additional ingredients.
- After choosing your desired food items, you can move to the Order view.
- After placing an order, it is added to Firebase database and you see a success screen.
- When you go to the History view, the list of placed orders is fetched.
- You can click on each order to see what it contains.

Content
- [Lesson 1 - Setup & Splash View](#lesson-1---Setup--Splash-View)
- [Lesson 2 - Home View](#lesson-2---Home-View)
- [Lesson 3 - Restaurant View](#lesson-3---Restaurant-View)
- [Lesson 4 - Ingredient, Food View, Navigation](#lesson-4---Ingredient-Food-View-Navigation)
- [Lesson 5 - Item & Order](#lesson-5---Item--Order)
- [Lesson 6 - Firebase](#lesson-6---firebase)
- [Lesson 7 - History View](#lesson-7---history-view)
- [Lesson 8 - Status, Discount, Flavor](#lesson-8---Status-Discount-Flavor)

## Resources
- UI/UX Designs [(Figma)](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=0%3A1&mode=design&t=ZJuhSsodiFsAJQOM-1)
- Icon, Assets, and data.json [(Google Drive)](https://drive.google.com/drive/folders/1Z8fyxMO2gOLS8z4Rys1Jo248CKKvGNRO?usp=sharing)

## Views & Previews

Views | Previews
-|-
HomeView | RestaurantPreview
RestaurantView | FoodPreview
OrderView | ItemPreview
StatusView | StatusPreview
HistoryView | OrderPreview
FoodView | N/A

## Utilities
- Components
- Navigation
- Firebase

## Three Restaurants

- In-N-Out Burger
- Five Guys
- Subway

# Lesson 1 - Setup & Splash View 

Task | Time
-|-
Introductions & Deliverfly demo | 20 min
Setup Github & Fork | 50 min
Break | 10 min
[Task 0] Create Project + Import Icon & Assets | 10 min
[Task 1] SplashView | 30 min

### Installing Xcode
1. Check macOS version -> **apple** (top-left corner) -> About This Mac -> macOS (last item on bottom) -> must be Sonoma 14+
2. Check if Xcode is installed -> if not Google "Xcode" -> find in App Store and start downloading
3. Agree to Terms & Conditions -> type user password
4. Select Platform to develop for: **iOS** (e.g. iOS 17.4 --- 7.23 GB)
5. Wait for download to complete

### Join Slack
1. Join via the invite link [(TUMO-SwiftUI)](https://join.slack.com/t/newworkspace-wya8979/shared_invite/zt-2ikq4yy5f-iaKpVIaUWiiRq0ja8vKWcg)
2. Sign in or make an account

### Explore Figma
Explore & explain Figma designs [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=2%3A1464&mode=design&t=pFzuasGGZB9nISJl-1)

## Setup GitHub & Fork
We'll setup a new Github repository and download Fork together. Students who don't have a Github account will make one.

### Fork Download
1. Google "fork" [https://git-fork.com](https://git-fork.com)
2. Click on **Download Fork for Mac**
3. Double-click and drag "dmg" file to "Applications" folder
4. Open Fork, right-click icon -> Options -> Keep in Dock

### Add GitHub Account to Fork
1. Top-left corner **Fork** -> Accounts... -> GitHub
2. Log in -> Authentication Type: Log in on GitHub.com (OAuth) (not Personal Access Token) -> Login: **username** or **email** -> input **password**
3. Enable notifications in menu bar -> Close
4. Go to **Fork** -> Settings... -> Git -> input your name or nickname -> ⚠️ make sure the email matches your github email

### Create New Repository
1. Go to github.com -> **New** (top-left green button)
2. Repository name: **Deliverfly-GivenName-FamilyName** (e.g. Deliverfly-Neli-Shahapuni)
3. Repository can be **Public** or **Private** (your choice)
4. Enable **Add a README file**
5. Add .gitignore -> template: *Swift*
6. Create Repository (green button)

### Create Develop Branch & Make Default
1. Go to **main** (top-left gray dropdown)
2. Find or create branch... -> type "develop" (all lowercase)
3. Click: Create branch **develop** from **main**
4. Go to **Settings** (list on top, last item) -> Default Branch (currently: main) -> click: switch to another branch (2 arrows) -> choose "develop" from dropdown -> Update

### Clone Repository to Fork
1. Go to repository -> click **Code** (top-right green button) -> Copy URL (post the URL via Slack channel)
2. Open Fork -> File -> Clone...
3. Location: /Documents OR /Desktop -> Open
4. Click **Clone**

### New branch: *feature/splash-view*
1. Go to fork & checkout 'develop'
2. Right-click 'develop' -> New Branch... -> name it **feature/splash-view**

## [Task 0] Create Project + Import Icon & Assets
1. **Create New Project...** -> App -> Next
2. Product Name: **Deliverfly**
3. Team: FirstName LastName (Personal Team) (e.g. Neli Shahapuni (Personal Team)) - it can also be the apple account or current user on the computer
4. Organization Identifier: **givennamefamilyname** (e.g. <ins>nelishahapuni</ins>) 
5. Interface: **SwiftUI**
6. Language: **Swift**
7. Storage: **None**
8. Disable **Include Tests**
9. Save project inside the folder named **Deliverfly-GivenName-FamilyName** (e.g. Deliverfly-Neli-Shahapuni)

### Explore Xcode
0. Increase Font size (if needed)
1. Show File Navigator
2. Run the app for the first time (click on the triangle, top-left) or **Command + R**
3. Click on the rectangle to stop running (wait for simulator to load if 1st time, don't close it)

### Import Assets
1. Go to Google Drive -> click on "Deliverfly" dropdown -> download [Google Drive](https://drive.google.com/drive/folders/1Z8fyxMO2gOLS8z4Rys1Jo248CKKvGNRO?usp=sharing)
2. Go to downloads -> Double-click to unzip
3. Go to Xcode -> Assets -> Drag 'Assets' folder to list
4. Click on 'AppIcon' and drag the "icon" image
5. Delete "Preview Content" folder
6. Run the app (click on the triangle, top-left)
7. When you get an error, click on the error, double-click on the **"Deliverfly/Preview Content"** and click on the minus (-) to remove it

### Commit changes
2. Make a commit on the **feature/splash-view** branch named <ins>**[Task 0] Create Project + Import Icon & Assets**</ins> -> Commit
3. Click **Push** (UP arrow) -> **Push**

## [Task 1] SplashView
1. Go to Xcode -> Find 'Deliverfly' folder (top-left) -> right-click -> New File... -> SwiftUI View -> name it 'SplashView'
2. Go to 'SplashView' file & follow along (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/1b84bb2a5b3b85cd130aa14cea576822aa24f7d4#diff-18146b0545cee938baea6d99c5b2c863da51b9ef994f2dae6d3ca21c6defbf25))
3. Click on the 'DeliverflyApp' file -> replace 'ContentView' with 'SplashView'.
4. Click on 'ContentView' file -> right-click 'delete' -> Move to Trash
5. Inside 'DeliverflyApp' file & follow along (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/1b84bb2a5b3b85cd130aa14cea576822aa24f7d4#diff-9407fec3f2e2997e0acff7cd8744435b196ac6ea87e37966c11fe745af1f8e97))
6. Choose simulator (top-middle of Xcode) -> Run app (wait for simulator to load if 1st time)

### Commit changes
1. Stage changes & make commit named: <ins>**[Task 1] SplashView**</ins> -> commit
2. Push to remote (arrow up 'push' button)

### Open Pull Request (from feature/splash-view to develop)
1. Go to github.com -> find repository (list on left) -> click on 'Compare and pull request' (if you can't see it, then go to 'Pull Requests' -> **New Pull Request** (green button))
2. base: develop <- compare: feature/splash-view
3. Click on 'Create pull request'
4. Click on 'Merge pull request' -> click on 'Confirm merge'
5. Go to Fork -> click 'Fetch' (arrow down outline) -> go to Branches -> right-click Checkout 'develop' -> Click 'Pull' (arrow down fill)

# Lesson 2 - Home View

Task | Time
-|-
[Task 2] RestaurantPreview | 40 min
[Task 3] HomeView | 40 min
Break | 10 min
[Task 4] Add Five Guys and Subway | 15 min (independently)
Check Work | 15 min

### New branch: *feature/home-view*
1. Go to fork & checkout 'develop'
2. Right-click 'develop' -> New Branch... -> name it **feature/home-view**

## [Task 2] RestaurantPreview
1. Double-click on 'Home' -> New File... -> SwiftUI View -> Next -> **RestaurantPreview** -> Create
2. Add headerImage, restaurantName, menuItems, and details (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/1346beba445f3d6e956b774f5d6c21fcba267243#diff-1921f86b86116933e69eca3fde39f98c5a705d5db65d3fbc3715f27718722189))
3. Add image, name, items, rating, time (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/a96ee6f1974a4f2b208daa9ddb2b144395586abc?diff=split&w=0))

## Make commit
1. Stage changes & make commit named: <ins>**[Task 2] RestaurantPreview**</ins> -> commit

## [Task 3] HomeView 
1. Go to Xcode -> Find 'Deliverfly' folder (top-left) -> right-click -> New File... -> SwiftUI View -> name it 'HomeView'
2. Select both 'SplashView' and 'HomeView' -> right click 'New Group from Selection' -> name it 'Views'
3. Open 'HomeView' file & follow along (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/5826c088044ca9cc0f882e15e34ef406613c317c?diff=unified&w=0#diff-8b69d00615e4bd06e1fdda225eb357507504ece9cf2ccb4e199f81781acfb0c3))
5. Inside 'DeliverflyApp' replace Text("home") with HomeView()

## Make commit
1. Stage changes & make commit named: <ins>**[Task 3] HomeView**</ins> -> commit
2. Push to remote (arrow up 'push' button)

## [Task 4] Add Five Guys and Subway
- Add 2 more 'RestaurantPreview's with the following info:

image | name | items | rating | time
-|-|-|-|-
.inNOut | In-N-Out Burger | Double Double - Chocolate Shake - French Fries | 5.0 | 20
.fiveGuys | Five Guys | Cheeseburger - Fries - Milkshake - Sandwich | 4.7 | 45
.subway | Subway | Wrap - Footlong - Salad - Cookie | 3.5 | 50

- Check Work together

## Make commit
1. Stage changes & make commit named: <ins>**[Task 4] Add Five Guys and Subway**</ins> -> commit
2. Push to remote (arrow up 'push' button)

## Open Pull Request
1. Go to github.com -> respository -> feature/home-view had recent pushes X seconds ago -> click **Compare and pull request** (title is not important)
2. base: developer <- compare: feature/home-view
3. Click on 'Create pull request'
4. Click on 'Merge pull request' -> click on 'Confirm merge'
5. Go to Fork -> Fetch -> right-click 'develop' -> Check out 'develop' -> Pull

# Lesson 3 - Restaurant View
Task | Time
-|-
[Task 5] Food model | 10 min
[Task 6] FoodPreview | 20 min (independently)
Check Work | 20 min
Break | 10 min
[Task 7] Restaurant model | 10 min 
[Task 8] RestaurantView | 20 min (independently)
Check Work | 30 min

### New branch: *feature/restaurant-view*
1. Go to fork & checkout 'develop'
2. Right-click 'develop' -> New Branch... -> name it **feature/restaurant-view**

## [Task 5] Food model
1. Go to Xcode -> Find 'Deliverfly' folder (top-left) -> right-click -> New File... -> Swift File -> name it 'Food'
2. Inside the 'Food' file, follow along so that the code looks like [this](https://github.com/nelishahapuni/Deliverfly/commit/6e29a1a66f7aa057173b6fd819559e43a8cea7b7#diff-b2d0dc5a730416ffa46d70645296fc77cbbb7698ac09577327f4b64958593253)
3. Copy the Food data.

## [Task 6] FoodPreview
1. New File... -> SwiftUI View -> name it 'FoodPreview'
2. Select 'RestaurantPreview' and 'FoodPreview' -> right click 'New Group from Selection' -> name it 'Previews'
3. Inside 'FoodPreview' add the property **let food: Food** and add .previewData to the #Preview
4. In the place for the ingredients add a Text("Standard"), which will be modified later
5. Make the FoodPreview following the Figma design [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=1-628&mode=design&t=hvdQqrxcgIxPXeqW-4) (20 min)
6. Check the work together (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/944b0bfe1875fea47655941b5f3165a38db55ed1#diff-685a40666be455cf6ce13610ae936701fa3ec039541e319ae76148f311d181f8))
7. Commit <ins>**[Task 6] FoodPreview**</ins>

## [Task 7] Restaurant model
1. New File... -> Swift File -> named 'Restaurant'
2. Select the 'Food' and 'Restaurant' files -> right click 'New Group from Selection' -> name it 'Models'
3. Create 'Restaurant' model (should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/5a310097b13b8ab1e2cf7df2c95f2324e1581bb3#diff-7e5125fbcc51cd1c8e4428635cef65ac8ee41fdbee84d337bea7c337a741a9a4)), edit HomeView (like [this](https://github.com/nelishahapuni/Deliverfly/commit/5a310097b13b8ab1e2cf7df2c95f2324e1581bb3#diff-8b69d00615e4bd06e1fdda225eb357507504ece9cf2ccb4e199f81781acfb0c3)) and RestaurantPreview (like [this](https://github.com/nelishahapuni/Deliverfly/commit/5a310097b13b8ab1e2cf7df2c95f2324e1581bb3#diff-a8e98329119a7b402e6b6ca584c573bb1ab21aec1c82787a4615f6408da38bdf))
4. Stage & make commit <ins>**[Task 7] Restaurant model**</ins>

## [Task 8] RestaurantView
1. Select 'Views' folder -> right-click -> New File... -> SwiftUI View -> named 'RestaurantView'
2. Follow the figma design [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=1-571&mode=design&t=4tA25fuLewK7g6DM-4) (20  min)
3. Check work (your code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/13d16dca28aa53291345846d9224b3f0d57970cb#diff-11d43d2aecf74890c59b5ea593cf129463bf402b27a5dadd32d0ee6d77e75d8d))
4. Right-click on the 'Deliverfly' folder -> New File... -> SwiftUI View -> named 'Components' (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/13d16dca28aa53291345846d9224b3f0d57970cb#diff-79c8ffb07034249b381534c7810cc298d4f577ef76830328eef6829535724e21))
5. Stage changes and commit <ins>**[Task 8] RestaurantView**</ins>

### Open Pull Request (from feature/restaurant-view to develop)
1. Go to github.com -> find repository (list on left) -> click on 'Compare and pull request' (if you can't see it, then go to 'Pull Requests' -> **New Pull Request** (green button))
2. base: develop <- compare: feature/restaurant-view
3. Click on 'Create pull request'
4. Click on 'Merge pull request' -> click on 'Confirm merge'
5. Go to Fork -> click 'Fetch' (arrow down outline) -> go to Branches -> right-click Checkout 'develop' -> Click 'Pull' (arrow down fill)

# Lesson 4 - Ingredient, Food View, Navigation

Task | Time
-|-
[Task 9] Ingredient enum | 10 min
[Task 10] FoodView | 10 min (setup) + 30 min (independently)
Break | 10 min
Check Work | 30 min
Navigation Logic | 10 min
[Task 11] Navigation | 20 min

### New branch: *feature/food-view*
1. Go to fork & checkout 'develop'
2. Right-click 'develop' -> New Branch... -> name it **feature/food-view**

## [Task 9] Ingredient enum
1. Select 'Models' folder -> right-click -> New File... -> Swift File -> named 'Ingredient'
2. Create 'Ingredient enum (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/6574ea84e0c11f063ba4208ab27dbdb97ed8f5d2#diff-d335ba9d675db917a4d0f02798fa06ca9bfbe17964212d55804a0a31fc2e071a))
3. Uncomment ingredients (command + /) in the 'Food' model (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/6574ea84e0c11f063ba4208ab27dbdb97ed8f5d2#diff-fd24ef46e054738fe6ed20dc725e06a1ce9b19cc852a6c329ab6d04e83d5045e))
4. Go to 'FoodPreview' -> var hasExtras: some View -> check if the ingredients for that item is empty (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/6574ea84e0c11f063ba4208ab27dbdb97ed8f5d2#diff-685a40666be455cf6ce13610ae936701fa3ec039541e319ae76148f311d181f8))
5. Stage changes and commit <ins>**[Task 9] Ingredient enum**</ins>

## [Task 10] FoodView
1. Select 'Views' folder -> right-click -> New File... -> SwiftUI View -> named 'FoodView'
2. Setup properties (dismiss, selectedIngredients, quantity, total, food)
3. Setup: **@ViewBuilder func foodView(_ item: Food) -> some View** and and **.sheet** to ScrollView (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/761e5d45ba57eaf610a265a22fe118dfd75c8bbe#diff-11d43d2aecf74890c59b5ea593cf129463bf402b27a5dadd32d0ee6d77e75d8d))
4. Work independently following the figma design [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=1-400&mode=design&t=NLBlJLMXhw6MHdA5-4)
5. Check work together (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/761e5d45ba57eaf610a265a22fe118dfd75c8bbe#diff-f276016364be2cac3f2edcf10b833ef53b5a6a8861a30bffb3229d4f3c59f3d2))
6. Stage changes and commit <ins>**[Task 10] FoodView**</ins>

## [Task 11] Navigation
1. Select the 'Deliverfly' folder -> create a new Swift File named 'Navigation'
2. Inside Navigation, create a @Published var navPath, and three funcs: goTo(), goBack(), goToRoot() - code should look like [this]()
3. Inside 'DeliverflyApp' create an @ObservedObject var navigation = Navigation() and NavigationStack (with .environmentObject(navigation)) - code should look like [this]()
4. Add **EnvironmentObject navigation** inside 'HomeView' and **go to restaurant view** - code should look like [this]()
5. Add **EnvironmentObject navigation** inside 'RestaurantView' and **go back** - code should look like [this]()
6. Commit <ins>[Task 11] Navigation</ins>

### Open Pull Request (from feature/food-view to develop)
1. Go to github.com -> 'Compare and pull request' (or 'Pull Requests' -> **New Pull Request**)
2. base: develop <- compare: feature/food-view
3. Click on 'Create pull request'
4. Click on 'Merge pull request' -> click on 'Confirm merge'
5. Go to Fork -> click 'Fetch' (arrow down outline) -> go to Branches -> right-click Checkout 'develop' -> Click 'Pull' (arrow down fill)

# Lesson 5 - Item & Order

Task | Time
-|-
[Task 12] Item model | 10 min
[Task 13] Order model | 10 min
[Task 14] ItemPreview | 10 min (independently)
[Task 15] OrderView | 30 min (independently)
Break | 10 min
Check work for all tasks | 50 min

### New branch: *feature/order-view*
1. Go to fork & checkout 'develop'
2. Right-click 'develop' -> New Branch... -> name it **feature/food-view**

## [Task 12] Item model
1. Select 'Models' folder -> right-click -> New File... -> Swift File -> named 'Item'
2. Add properties, the code should look like [this](https://github.com/nelishahapuni/Deliverfly/pull/8/commits/ae2d51c72e706cfb26efcf349707fc145ac0175a#diff-2b0e17e32d4f288a334cc5dbe442febfaa4f727d04a6deec83b755ecdac97fcc)
3. Stage and commit changes <ins>**[Task 12] Item model**</ins>

## [Task 13] Order model
1. Select 'Models' folder -> right-click -> New File... -> Swift File -> named 'Order'
2. Add properties, the code should look like [this](https://github.com/nelishahapuni/Deliverfly/pull/8/commits/6f6a5153e075e8a7630aafd0fa37338089188a69#diff-2ad111119ebc42a2e1577c6c1a45c9751f197604f21d022ca83760f900424694)
3. Stage and commit changes <ins>**[Task 14] Order model**</ins>

## [Task 14] ItemPreview
1. Select 'Previews' folder -> right-click -> New File... -> SwiftUI View -> named 'ItemPreview'
2. Follow the figma design [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=9-52&mode=design&t=BjjaD1Toc4Tbg0eQ-4)
3. Check the work together (later), code should look like [this](https://github.com/nelishahapuni/Deliverfly/pull/8/commits/4a97af28bf039d8f91e91cba61818c6f5a8b914e#diff-787e6f760fce076872628063800baf0cdec3275d899caf1b8c55944d6572f479)
4. Stage and commit changes <ins>**[Task 13] ItemPreview**</ins>

## [Task 15] OrderView
1. Select 'Views' folder -> right-click -> New File... -> SwiftUI View -> named 'OrderView'
2. Follow the figma design [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=9-33&mode=design&t=BjjaD1Toc4Tbg0eQ-4)
3. Create: OrderView
4. Modify: Navigation, DeliverflyApp, RestaurantView, FoodView

# Check work
1. Inside 'OrderView' the code should look like [this](https://github.com/nelishahapuni/Deliverfly/pull/8/commits/3249610e80cc2720a84fd0a968e9d0f7813332c9#diff-b32cc37f18a2994e679ab596dc38f9b978d98e022ad4d09f4d19cca9558ae50d)
2. Inside 'Navigation' add 'case order' and additional configurations (should look like [this](https://github.com/nelishahapuni/Deliverfly/pull/8/commits/3249610e80cc2720a84fd0a968e9d0f7813332c9#diff-cab98054499f5b663e2593cca642275689a1219764a44dfd1d7d778284ab6dca))
3. Inside 'DeliverflyApp' add 'case order...' (should look like [this](https://github.com/nelishahapuni/Deliverfly/pull/8/commits/3249610e80cc2720a84fd0a968e9d0f7813332c9#diff-9407fec3f2e2997e0acff7cd8744435b196ac6ea87e37966c11fe745af1f8e97))
4. Inside 'RestaurantView' add 'hasCartItems', 'order', init() {...}, .onChange(of: ...) {...} and 'cartIcon' (code looks like [this](https://github.com/nelishahapuni/Deliverfly/pull/8/commits/3249610e80cc2720a84fd0a968e9d0f7813332c9#diff-11d43d2aecf74890c59b5ea593cf129463bf402b27a5dadd32d0ee6d77e75d8d))
5. Inside 'FoodView' add **@Binding var orderItems: [Item]** and **func addToCartTapped()** (code looks like [this](https://github.com/nelishahapuni/Deliverfly/pull/8/commits/3249610e80cc2720a84fd0a968e9d0f7813332c9#diff-f276016364be2cac3f2edcf10b833ef53b5a6a8861a30bffb3229d4f3c59f3d2))
6. Stage and commit changes <ins>**[Task 15] OrderView**</ins>

### Open Pull Request (from feature/order-view to develop)
1. Go to github.com -> 'Compare and pull request' (or 'Pull Requests' -> **New Pull Request**)
2. base: develop <- compare: feature/order-view
3. Click on 'Create pull request'
4. Click on 'Merge pull request' -> click on 'Confirm merge'
5. Go to Fork -> click 'Fetch' (arrow down outline) -> go to Branches -> right-click Checkout 'develop' -> Click 'Pull' (arrow down fill)

# Lesson 6 - Firebase

Task | Time
-|-
Create Firebase Project | 10 min
[Task 16] Setup Firebase | 20 min 
Input Data | 20 min
Break | 10  min
[Task 17] Fetch Foods | 30 min
[Task 18] Fetch Restaurants | 30 min

## Create Firebase Project
1. Go to [http://console.firebase.google.com](http://console.firebase.google.com) -> Sign in
2. Sign in with your account or create an account
3. Go to "+ Add project"
4. Enter Project name -> Deliverfly-GivenName-LastName (e.g. Deliverfly-Neli-Shahapuni) -> Continue
5. Disable "Enable Google Analytics for this project" -> Create Project

### New branch: *feature/firebase*
1. Go to fork & checkout 'develop'
2. Right-click 'develop' -> New Branch... -> name it **feature/firbase**

## [Task 16] Setup Firebase
1. Register app
    - Bundle Identifier -> go to Xode -> Deliverfly (blue top-left file) -> Signing & Capabilities -> copy Bundle Identifier
    - App nickname: Deliverfly -> Register app
2. Download config file
    - click on: Download 'GoogleService-Info.plist'
    - Find it in downloads & drag it in bottom of project files
    - In Xcode -> Enable 'Copy items if needed' -> Finish
    - Back to firebase -> click 'Next'
3. Add Firebase SDK
    - Go to Xcode -> File -> Add Package Dependencies...
    - Paste this link in the top-right: [https://github.com/firebase/firebase-ios-sdk](https://github.com/firebase/firebase-ios-sdk) -> Add Package
    - Select packages:
        - FirebaseDatabase
        - FirebaseDatabseSwift
        - FirebaseFirestore
        - FirebaseFirestoreSwift
    - Click 'Add Packages'
    - Press 'Command + B' to build
4. Add initialization code
    - Go to 'DeliverflyApp' file:
        - import FirebaseCore
        - under the properties, paste this code (should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/d6732abb33041198eda547d9a14f7c13a119dc6e#diff-9407fec3f2e2997e0acff7cd8744435b196ac6ea87e37966c11fe745af1f8e97))
``` swift
init() {
    FirebaseApp.configure()
}
```
5. Next steps
    - click 'Continue to console'
8. Commit <ins>[Task 16] Setup Firebase</ins> and push commit (if you receive any emails, ignore them)

## Input Data
1. Build -> 'Realtime Database' -> click on 'Create Database'
2. Realtime Database location -> Belgium (europe-west1) -> Next
3. Start in test mode -> Enable
4. Hover over the url and click on the "+" on the right
5. Type "Foods" (don't click enter) and click on "+"
    - id: 100
        - name: "Double Double" (write without the quotes "")
        - description: "Freshly baked buns, American cheese, two beef patties, fleshly sliced or grilled onions, lettuce, spread, and tomatoes." (write without the quotes "")
        - image: doubleDouble
        - price: 3.95
        - ingredients
            - 0: salt
            - 1: patty
            - 2: onion
            - 3: tomato
            - 4: pepper
            - 5: mayo
            - 6: cheese
            - 7: ketchup
6. Type "Restaurants" (don't click enter) and click on "+"
    - id: 1
        - name: "In-N-Out Burger"
        - description: "From the first bite of your burger to your last french fry, quality is the most important ingredient at In-N-Out Burger."
        - image: inNOut
        - rating: 5
        - time: 20
        - foods
            - 0: "101"
            - 1: "102"
            - 2: "103"
            - 3: "104
7. Click on the 3 dots in the top-right corner -> Import JSON -> upload 'data.json' from the Assets folder (can also be found [here](https://drive.google.com/file/d/1Yx0PywTQ3Br9adfO7c30WzSvD4pELgm_/view?usp=share_link))
8. Click 'Import'
9. Now you have both 'Foods' and 'Restaurants' data

## [Task 17] Fetch Foods
1. Click on 'Deliverfly' folder -> Right-click 'New File...' -> Swift File -> named 'Firebase'
2. Inside 'Firebase' -> fetch foods from firebase (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/fe84f2ab12ac7f5c49fa92f35ed42095f7356799#diff-ca93b05f9fb99bd667d50faceee430f65a7da6a80eebe2c91c1d50f5b88cc418))
3. Go to 'DeliverflyApp' and add @ObservedObject firebase, initialize it & .environmentObject (should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/fe84f2ab12ac7f5c49fa92f35ed42095f7356799#diff-9407fec3f2e2997e0acff7cd8744435b196ac6ea87e37966c11fe745af1f8e97))
4. Go to 'HomeView' and add @EnvironmentObject firebase. To the ScrollView add a .onAppear { ... } (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/fe84f2ab12ac7f5c49fa92f35ed42095f7356799#diff-8b69d00615e4bd06e1fdda225eb357507504ece9cf2ccb4e199f81781acfb0c3))
5. Run the app (command + R) and see the log
6. Commit <ins>[Task 17] Fetch Foods</ins> and push commit

## [Task 18] Fetch Restaurants
1. Inside 'Firebase' -> fetch restaurants from firebase (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/e5d0081ebb2ed8cc13725df87ec59d3c57dd7f29#diff-ca93b05f9fb99bd667d50faceee430f65a7da6a80eebe2c91c1d50f5b88cc418))
2. Inside 'HomeView' add ProgressView() and replace list with firebase.restaurants (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/e5d0081ebb2ed8cc13725df87ec59d3c57dd7f29#diff-8b69d00615e4bd06e1fdda225eb357507504ece9cf2ccb4e199f81781acfb0c3))
3. Commit <ins>[Task 18] Fetch Restaurants</ins> and push commit

### Open Pull Request (from feature/firebase to develop)
1. Go to github.com -> 'Compare and pull request' (or 'Pull Requests' -> **New Pull Request**)
2. base: develop <- compare: feature/firebase
3. Click on 'Create pull request'
4. Click on 'Merge pull request' -> click on 'Confirm merge'
5. Go to Fork -> click 'Fetch' (arrow down outline) -> go to Branches -> right-click Checkout 'develop' -> Click 'Pull' (arrow down fill)

# Lesson 7 - History View

Task | Time
-|-
[Task 19] Place Order | 15 min
[Task 20] OrderPreview | 10 min (Independently)
[Task 21] HistoryView | 10 min (Independently)
[Task 22] Fetch Orders | 25 min (Independently)
Break | 10  min
Check Work | 50 min

### New branch: *feature/history-view*
1. Go to fork & checkout 'develop'
2. Right-click 'develop' -> New Branch... -> name it **feature/history-view**

## [Task 19] Place Order
1. Go to 'Firebase' file -> add func placeOrder (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/39ab73d2b333743cc90f1b04c336e495887837fe#diff-ca93b05f9fb99bd667d50faceee430f65a7da6a80eebe2c91c1d50f5b88cc418))
2. Go to 'OrderView' and add @EnvironmentObject firebase. Inside 'placeOrder' add Task { firebase.placeOrder(order) } (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/39ab73d2b333743cc90f1b04c336e495887837fe#diff-b32cc37f18a2994e679ab596dc38f9b978d98e022ad4d09f4d19cca9558ae50d))

## [Task 20] OrderPreview
1. Select 'Previews' folder -> right-click -> New File... -> SwiftUI View -> named 'OrderPreview'
2. Follow the Figma design [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=2-1503&mode=design&t=pFzuasGGZB9nISJl-4)
3. Inside 'OrderPreview' follow along (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/843b87c46991bdaf9a732039d1d18ea7121fe166#diff-c29877e817af8d44a7c6d139d02c9610f0c3ae37ad05f68ddb8da17a20f66f4b))
4. Stage & commit <ins>[Task 19] OrderPreview</ins> and push commit

## [Task 21] HistoryView
1. Select 'Views' folder -> right-click -> New File... -> SwiftUI View -> named 'HistoryView'
2. Follow the figma design [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=2-1464&mode=design&t=pFzuasGGZB9nISJl-4)
3. Inside 'HistoryView' follow along (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/8c66a7eca48f500b3c9de3631aef73590da2e1b6#diff-cfedd1fac6fd82df8fffa0a1bde01f092e86241c3bbd1224268389eac410584e))
4. Inside 'Navigation' uncomment 'case history'
5. Inside 'DeliveryApp' add case .history: HistoryView() (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/8c66a7eca48f500b3c9de3631aef73590da2e1b6#diff-9407fec3f2e2997e0acff7cd8744435b196ac6ea87e37966c11fe745af1f8e97))
6. Inside 'HomeView' when you click the history button, add 'navigation.goTo(view: .history)' (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/8c66a7eca48f500b3c9de3631aef73590da2e1b6#diff-8b69d00615e4bd06e1fdda225eb357507504ece9cf2ccb4e199f81781acfb0c3))
7. Stage & commit <ins>[Task 20] HistoryView</ins> and push commit

## [Task 22] Fetch Orders
1. Inside 'Firebase' add @Published var orders, func fetchOrders(), func resetOrders(), and func decodeOrder (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/ae1828980041412854c9236239b28cb5a63c6f12#diff-ca93b05f9fb99bd667d50faceee430f65a7da6a80eebe2c91c1d50f5b88cc418))
2. Inside 'HistoryView' remove 'orders' and replace it with 'firebase.orders'. Inside .task call fetchOrders() and inside .onDisappear call resetOrders() (code should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/ae1828980041412854c9236239b28cb5a63c6f12#diff-cfedd1fac6fd82df8fffa0a1bde01f092e86241c3bbd1224268389eac410584e))

### Open Pull Request (from feature/history-view to develop)
1. Go to github.com -> 'Compare and pull request' (or 'Pull Requests' -> **New Pull Request**)
2. base: develop <- compare: feature/history-view
3. Click on 'Create pull request'
4. Click on 'Merge pull request' -> click on 'Confirm merge'
5. Go to Fork -> click 'Fetch' (arrow down outline) -> go to Branches -> right-click Checkout 'develop' -> Click 'Pull' (arrow down fill)

# Lesson 8 - Status, Discount, Flavor
Task | Time
-|-
[Bonus 1] Status | 20 min
[Bonus 2] Discount | 40 min (Independently)
Break | 10 min
[Bonus 3] Flavor | 50 min (Independently)

### New branch: *feature/bonus
1. Go to fork & checkout 'develop'
2. Right-click 'develop' -> New Branch... -> name it **feature/bonus**

## [Bonus 1] Status
- Make Status enum, StatusPreview, and StatusView.
- Add StatusView(status: .success) when pressing "Place Order" in Order View.
- Add StatusPreview(status: .error) (instead of Text("No orders")) if there are no orders in the databse.
- All changes should look like [this](https://github.com/nelishahapuni/Deliverfly/commit/df13447d204768983699a317205c0077719c3372)
- (optional) Make a pull-request & merge to develop.

## [Bonus 2] Discount
- Check-out feature/bonus to continue
- This task is done fully independently and doesn't have a ready solution.
- Hint: Use environment object to persist the discount info across different views (similar to navigation & firebase)
- Follow the figma designs [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=1-98&mode=design&t=pFzuasGGZB9nISJl-4)

## [Bonus 3] Flavor
- This task is done fully independently and doesn't have a ready solution.
- Hint: Create a Flavor enum (similar to Ingredient)
- Follow the figma designs [here](https://www.figma.com/file/lg7wWZA0QmP3UXpcMpbxg4/Deliverfly?type=design&node-id=180-391&mode=design&t=pFzuasGGZB9nISJl-4)
