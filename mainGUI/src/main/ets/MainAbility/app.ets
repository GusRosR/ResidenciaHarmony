import hilog from '@ohos.hilog';
import window from '@ohos.window';
import app from '@system.app';
import router from '@ohos.router';

export default {

  selectedPath: '',

  onCreate() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onCreate');
    window.getTopWindow().then((win) => {
      win.on('windowSizeChange',(data)=>{
        console.info('Succeeded in enabling the listener for window size changes. Data: ' + JSON.stringify(data))
      })
      let names = [];
      win.setSystemBarEnable(names, (err) => {
        if (err.code) {
          console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          return;
        }
        console.info('Succeeded in setting the system bar to be invisible.');
      });
    });
  },
  onSaveAbilityState(outState) {
    // Save the selected path before leaving the page
    outState.selectedPath = this.selectedPath;
    console.info("App state saved with path:", outState.selectedPath);
  },

  onRestoreAbilityState(inState) {
    // Restore the saved path when returning to the app
    if (inState.selectedPath) {
      this.selectedPath = inState.selectedPath;
      this.saveLocationBtnText = "Directory selected: " + this.selectedPath;
      console.info("App state restored with path:", this.selectedPath);
    }
  },
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onDestroy');
  },
}