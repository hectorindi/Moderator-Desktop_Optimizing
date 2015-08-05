/*******************************************************************************
 * Copyright (c) iSpring Solutions, Inc. 
 * All rights reserved. This source code and the accompanying materials are made
 * available under the terms of the iSpring Public License v1.0 which accompanies
 * this distribution, and is available at:
 * http://www.ispringsolutions.com/legal/public-license-v10.html
 *
 *******************************************************************************/


package ispring.as2player.impl
{
	import ispring.as2player.IAnimationStep;
	
	public class AnimationStep implements IAnimationStep
	{
		private var m_obj:Object;
		
		public function AnimationStep(obj:Object)
		{
			m_obj = obj;
		}
		
		public function get playTime():Number
		{
			return m_obj.playTime;
		}
		
		public function get pauseTime():Number
		{
			return m_obj.pauseTime;
		}
		
		public function get startTime():Number
		{
			return m_obj.startTime;
		}
		
		public function get pauseStartTime():Number
		{
			return m_obj.startTime;
		}
		
		public function get pauseEndTime():Number
		{
			return m_obj.startTime;
		}
	}
}
