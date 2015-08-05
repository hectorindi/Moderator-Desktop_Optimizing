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
	public interface ISlidesCollection
	{
		function get slidesCount():Number;
		function getSlideInfo(slideIndex:Number):ISlideInfo;
		function get visibleSlidesCount():Number;
		function getVisibleSlide(visibleSlideIndex:Number):ISlideInfo;
	}
}
