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
	
	public class PlaybackEvent extends Event
	{
		public static const PAUSE_PLAYBACK:String = "pausePlayback";
		public static const START_PLAYBACK:String = "startPlayback";
		public static const PLAYBACK_SUSPENDED:String = "playbackSuspended";
		public static const PLAYBACK_RESUMED:String = "playbackResumed";
		public static const SEEKING_COMPLETE:String = "seekingComplete";
		public static const PRESENTATION_PLAYBACK_COMPLETE:String = "presentationPlaybackComplete";
				
		public function PlaybackEvent(type:String)
		{
			super(type);
		}
		
		public override function clone():Event
		{
			return new PlaybackEvent(type);
		}
	}
}
