package components
{
	import mx.managers.PopUpManager;
	
	import spark.components.TitleWindow;
	import interfaces.IpopUp;
	
	public class CustomTitleWindow extends TitleWindow implements IpopUp
	{
		public function CustomTitleWindow()
		{
			super();
		}
		
		public function closeWindow():void
		{
			PopUpManager.removePopUp(this);
		}
	}
}