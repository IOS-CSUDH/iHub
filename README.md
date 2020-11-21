# iHub

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
iHub is an app where it allows you to recieve multiple social media notifications in one hub.

### App Evaluation

- **Category:**
    - Social Media 
- **Mobile:**
    - IOS
- **Story:**
    - An app that unifies Facebook, Twitter, and Printrest all under one app. All notifications can be viewed in one feed or individually.
- **Market:**
    - The market for this app would consist of all age groups so long as they have access to social media accounts.
- **Habit:**
    - This app would be checked often so long as the user has incoming notifications from the seperate social medias.
- **Scope:**
    - First we focus on users of Twitter, Facebook, and Pinterest but this app could evolve into one that encompases all social media to broaden its usage. Large potential with Snapchat and TikTok.
## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can register a new account
* User can login
* User can logout
* User can post
* User can see feed
* Settings

**Optional Nice-to-have Stories**

* Profile update
* View friend's profiles
* Add friends

### 2. Screen Archetypes

* Login
    * User can login
* Register - User signs up and logs into their account
    * User can register a new account
* Profile
    * User can see feed
    * User can update their profile
* Logout
    * User can logout
* Post
    * User can post

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* All notifications
* Facebook notifications
* Pinterest notifications
* Twitter notifications
* Done
* Settings

**Flow Navigation** (Screen to Screen)

* Main Page [iHub] welcome page --> Force Login to one social media
   * Second screen where Facebook, Pinterest,   Twitter ta
* Facebook Tab jumps Facebook login Page
   * View notifications from Facebook
* Pinterest Tab jumps Pinterest login Page
   * View notifications from Pinterest
* Twitter Tab jumps Twitter login Page
    * View notifications from Twitter
* Done tab jumps into page where all social media's notifaction seperately
    * It has tab for all above social media, 
        * each tab jump into belonging page where user can see seperately notification and post
    * It has back tab which let to go back to the second screen
* Settings tab
    * log out of individual social media


## Wireframes
<img src= "https://github.com/IOS-CSUDH/iHub/blob/main/Assets/Wireframe/Wireframe-1.png" width=600>
<img src="https://github.com/IOS-CSUDH/iHub/blob/main/Assets/Wireframe/Wireframe-2.png" width=600>
<img src="https://github.com/IOS-CSUDH/iHub/blob/main/Assets/Wireframe/Wireframe-3.png" width=600>


### [BONUS] Digital Wireframes & Mockups
https://www.figma.com/file/SnSgpbQCZd9Kq0TUXh837p/iHub?node-id=0%3A1
### [BONUS] Interactive Prototype
https://www.figma.com/file/SnSgpbQCZd9Kq0TUXh837p/iHub?node-id=0%3A1
## Schema  [This section will be completed in Unit 9]
### Models
#### Post (Facebook)
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | facObjectId      | String   | unique id for the user post (default field) |
   | facAuthor        | Pointer to User| image author |
   | facImage         | File     | image that user posts |
   | facCaption       | String   | image caption by author |
   | facCreatedAt     | DateTime | date when post is created (default field) |
#### Post (Twitter)
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | twtObjectId      | String   | unique id for the user post (default field) |
   | twtAuthor        | Pointer to User| image author |
   | twtImage         | File     | image that user posts |
   | twtCaption       | String   | image caption by author |
   | twtCreatedAt     | DateTime | date when post is created (default field) |
#### Post (Pinterest)
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | pinObjectId      | String   | unique id for the user post (default field) |
   | pinAuthor        | Pointer to User| image author |
   | pinImage         | File     | image that user posts |
   | pinCaption       | String   | image caption by author |
   | pinCreatedAt     | DateTime | date when post is created (default field) |
   | pinWebsite       | Pointer to Website | website origin |
   | pinCommentsCount | Number   | number of comments that pin has |

#### Notification (Facebook)
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | facObjectId      | String   | unique id for the user post (default field) |
   | facAuthor        | Pointer to User| image author |
   | facCreatedAt     | DateTime | date when post is created (default field) |    
#### Notification (Twitter)
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | twtObjectId      | String   | unique id for the user post (default field) |
   | twtAuthor        | Pointer to User| image author |
   | twtCreatedAt     | DateTime | date when post is created (default field) |
#### Notification (Pinterest)
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | pinObjectId      | String   | unique id for the user post (default field) |
   | pinAuthor        | Pointer to User| image author |
   | pinCreatedAt     | DateTime | date when post is created (default field) |

[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
##### Facebook API
- Base URL - [http://www.graph.facebook.com](http://www.graph.facebook.com)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /v9.0/{post-id} HTTP/1.1 | get post
    `GET`    | /{user_id}/notifications | get notification
##### Twitter API
- Base URL - [https://api.twitter.com/1.1/tweets/search/](https://api.twitter.com/1.1/tweets/search/)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /v1.1/{status} HTTP/1.1 | get post
    `GET`    | /{user_id}/user_timeline | get notification
##### Pinterest API
- Base URL - [https://api.tumblr.com](https://api.tumblr.com)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /posts | get posts
    `GET`    | /user/dashboard | get notifications
'SnapChat snapkit api https://sdk.snapkit.com'
