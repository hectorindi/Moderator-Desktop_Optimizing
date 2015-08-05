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
	
	public class AcquireFocusEvent extends PlaybackEvent
	{
		public static const KEYBOARD_FOCUS_STATE_CHANGED:String = "keyboardFocusStateChanged";
		
		private var m_acquireFocus:Boolean;
		
		public function AcquireFocusEvent(type:String, acquireFocus:Boolean = false)
		{
			super(type);
			m_acquireFocus = acquireFocus;
		}
		
		public function get acquireFocus():Boolean
		{
			return m_acquireFocus;
		}
		
		public override function clone():Event
		{
			return new AcquireFocusEvent(type, acquireFocus);
		}
	}
}
