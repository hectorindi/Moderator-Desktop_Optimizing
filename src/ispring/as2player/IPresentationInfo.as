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
	public interface IPresentationInfo
	{
		function get title():String;
		function get slides():ISlidesCollection;
		function get slideWidth():Number;
		function get slideHeight():Number;
		function hasPresenter():Boolean;
		function get presenterInfo():IPresenterInfo;
		function get frameRate():Number;
		function get duration():Number;
		function hasCompanyInfo():Boolean;
		function get companyInfo():ICompanyInfo;
		function hasReferences():Boolean;
		function get references():IReferencesCollection;
		function get visibleDuration():Number;
		function get presenters():IPresentersCollection;
	}
}
