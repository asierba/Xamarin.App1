using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AppCenter.Crashes;
using Xamarin.Forms;

namespace App1
{
	public partial class MainPage : ContentPage
	{
		public MainPage()
		{
			InitializeComponent();
		}

        private void Button_Clicked()
        {

        }

		private void Button_OnClicked(object sender, EventArgs e)
		{
			throw new NotImplementedException("this is broken! :(");
        }

	    private void Error(object sender, EventArgs e)
	    {
	        try
	        {
	            throw new NotImplementedException("this is broken! :(");
            }
	        catch (Exception exception)
	        {
	            Crashes.TrackError(exception);
	        }
	    }


	}
}
