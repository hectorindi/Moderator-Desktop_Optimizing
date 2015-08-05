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

	public class StepPlaybackEvent extends PlaybackEvent
	{
		public static const ANIMATION_STEP_CHANGED:String = "animationStepChanged";

		private var m_stepIndex:Number;

		public function StepPlaybackEvent(type:String, stepIndex:Number = 0)
		{
			super(type);
			m_stepIndex = stepIndex;
		}

		public function get stepIndex():Number
		{
			return m_stepIndex;
		}

		public override function clone():Event
		{
			return new StepPlaybackEvent(type, stepIndex);
		}
	}
}
