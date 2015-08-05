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
	
	public class PlaybackPositionEvent extends PlaybackEvent
	{
		public static const SLIDE_POSITION_CHANGED:String = "slidePositionChanged";
		
		private var m_position:Number;
		
		public function PlaybackPositionEvent(type:String, position:Number = 0)
		{
			super(type);
			m_position = position;
		}
		
		public function get position():Number
		{
			return m_position;
		}
		
		public override function clone():Event
		{
			return new PlaybackPositionEvent(type, position);
		}
	}
}
