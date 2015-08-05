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
	
	public class PlayerEvent extends Event
	{
		public static const PLAYER_INIT:String = "playerInit";
		
		public function PlayerEvent(type:String)
		{
			super(type);
		}
		
		public override function clone():Event
		{
			return new PlayerEvent(type);
		}
	}
}
