#import "NativeMethods.h"
#import <ABI44_0_0React/ABI44_0_0RCTEventDispatcher.h>
#import <ABI44_0_0React/ABI44_0_0RCTScrollView.h>

namespace ABI44_0_0reanimated {

std::vector<std::pair<std::string, double>> measure(int viewTag, ABI44_0_0RCTUIManager *uiManager)
{
  UIView *view = [uiManager viewForABI44_0_0ReactTag:@(viewTag)];

  UIView *rootView = view;

  if (view == nil) {
    return std::vector<std::pair<std::string, double>>(1, std::make_pair("x", -1234567.0));
  }

  while (rootView.superview && ![rootView isABI44_0_0ReactRootView]) {
    rootView = rootView.superview;
  }

  if (rootView == nil) {
    return std::vector<std::pair<std::string, double>>(1, std::make_pair("x", -1234567.0));
  }

  CGRect frame = view.frame;
  CGRect globalBounds = [view convertRect:view.bounds toView:rootView];

  std::vector<std::pair<std::string, double>> result;
  result.push_back({"x", frame.origin.x});
  result.push_back({"y", frame.origin.y});

  result.push_back({"width", globalBounds.size.width});
  result.push_back({"height", globalBounds.size.height});

  result.push_back({"pageX", globalBounds.origin.x});
  result.push_back({"pageY", globalBounds.origin.y});
  return result;
}

void scrollTo(int scrollViewTag, ABI44_0_0RCTUIManager *uiManager, double x, double y, bool animated)
{
  UIView *view = [uiManager viewForABI44_0_0ReactTag:@(scrollViewTag)];
  ABI44_0_0RCTScrollView *scrollView = (ABI44_0_0RCTScrollView *)view;
  [scrollView scrollToOffset:(CGPoint){(CGFloat)x, (CGFloat)y} animated:animated];
}

void setGestureState(id<ABI44_0_0RNGestureHandlerStateManager> gestureHandlerStateManager, int handlerTag, int newState)
{
  if (gestureHandlerStateManager != nil) {
    [gestureHandlerStateManager setGestureState:newState forHandler:handlerTag];
  }
}

}
