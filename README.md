# Private Window Status for Safari

This is a simple Safari App Extension that shows if the current window is Private or not.

When I'm using Dark Mode on macOS, I have a very difficult time determining if the current window in Safari is Private or not. To solve that issue, this Extension puts a button (non-functioning) on the tool bar that shows an icon of the current Private state.

* Private: ![Private Icon](https://github.com/cweirup/SafariPrivateWindowStatus/blob/main/.README/privateicon.png)
* Non-Private: ![Non-Private Icon](https://github.com/cweirup/SafariPrivateWindowStatus/blob/main/.README/nonprivateicon.png)

__One thing to note:__ If you open a new window without a web page, the button will default to the non-Private icon. This is due to the fact that the Safari App Extension API to determine if a window is Private is based on the active page. Since no page is active, that information is "nil", and I just default to the non-Private icon. Once you load page, it will update to the appropriate icon.

## License
Private Window Status is available under the MIT license. See the [LICENSE.md](https://github.com/cweirup/SafariPrivateWindowStatus/blob/master/LICENSE.md) file for more info.
