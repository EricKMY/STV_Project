# How To Run The Test  
1.Install [appium](http://appium.io/)
2.Install [Android Studio](https://developer.android.com/studio/?gclid=Cj0KCQjw6PD3BRDPARIsAN8pHuHK5oztDInd2zIiI2gZFu3UESvaMolx2u5OPk9tThK0rkGyrMmDJBoaApRnEALw_wcB&gclsrc=aw.ds)
3.Install [appiumlibrary](https://pypi.org/project/robotframework-appiumlibrary/)
4.Install [RED](https://github.com/nokia/RED)<-optional, may run by cmd.
5.Create apk of "moneywallet" through "Android Studio"
6.Create a Virtual Device through Android Studio and run  
* AVD Name: Pixel 2 API 25
* Nougat: Android 7.1.1 x86

7-1.Import and run "moneywallet_test_automation" through RED IDE
7-2.Run by cmd
> python -m robot "."