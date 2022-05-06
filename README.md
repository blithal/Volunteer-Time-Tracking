# Getting Started
Before running the program, install the Flutter extension in VSCode: https://www.youtube.com/watch?v=vBgCgHBMR3c
The video also shows how to run a program in Flutter. However, our app requires you to set up your backend before running the app. To do this:

1) Using Terminal/Command prompt, navigate to the "backend/library" directory within the project folder.

2) If VSCode prompts you to update any packages (such as Flutter's), do so.

3) Enter the command "python3 manage.py runserver". If that causes an error, try "python manage.py runserver". If that doesn't work, make sure your python version is up to date. https://www.python.org/downloads/

4a) Once your server is running, you can run the program from VSCode and it should launch your app into your web browser.
4b) If you want to test on a mobile emulator like Android Studio, run through the emulator in VSCode using ctrl+shift+p and select the emulation option. Wait a moment for it to initialize, then run the program and it will show up in the emulator.

5) You will be brought the login screen...
5a) User account login - username: "user" --- password: "password".
5b) Admin account login - username: "admin" --- password: "superuser"

6) You can now mess with any of the functions implemented for users and admins in a local environment.
