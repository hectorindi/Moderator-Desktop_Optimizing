/*******************************************************************************
 * Copyright (c) iSpring Solutions, Inc. 
 * All rights reserved. This source code and the accompanying materials are made
 * available under the terms of the iSpring Public License v1.0 which accompanies
 * this distribution, and is available at:
 * http://www.ispringsolutions.com/legal/public-license-v10.html
 *
 *******************************************************************************/

// ActionScript file

package ispring.flex
{
	import flash.events.Event;
	
	import ispring.as2player.IPlayer;
	
	public class PlayerInitEvent extends Event
	{
		public static const PLAYER_INIT:String = "playerInit";
		
		public var player:IPlayer;
		
		public function PlayerInitEvent(type:String, _player:IPlayer)
		{
			super(type);
			
			player = _player;
		}
	}
}