class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds

    bvc = BrochureRacksViewController.alloc.init
    nav = UINavigationController.alloc.initWithRootViewController bvc

    @window.rootViewController = nav
    @window.makeKeyAndVisible
    true
  end
end
