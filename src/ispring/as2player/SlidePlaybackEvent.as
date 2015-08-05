/*******************************************************************************
 * Copyright (c) iSpring Solutions, Inc. 
 * All rights reserved. This source code and the accompanying materials are made
 * available under the terms of the iSpring Public License v1.0 which accompanies
 * this distribution, and is available at:
 * http://www.ispringsolutions.com/legal/public-license-v10.html
 *
 *******************************************************************************/


package ispring.as2player
{
	import flash.events.Event;
	
	public class SlidePlaybackEvent extends PlaybackEvent
	{
		public static const CURRENT_SLIDE_INDEX_CHANGED:String = "currentSlideIndexChanged";
		public static const SLIDE_LOADING_COMPLETE:String = "slideLoadingComplete";
		
		private var m_slideIndex:Number;
		
		public function SlidePlaybackEvent(type:String, slideIndex:Number = 0)
		{
			super(type);
			m_slideIndex = slideIndex;
		}
		
		public function get slideIndex():Number
		{
			return m_slideIndex;
		}
		
		public override function clone():Event
		{
			return new SlidePlaybackEvent(type, slideIndex);
		}
	}
}
