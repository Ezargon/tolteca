<?php
/**
 * This is a sample email template. It will just print out all of the request data:
 *
 * @package     Joomla.Plugin
 * @subpackage  Fabrik.form.email
 * @copyright   Copyright (C) 2005-2013 fabrikar.com - All rights reserved.
 * @license     GNU/GPL http://www.gnu.org/copyleft/gpl.html
 */

// No direct access
defined('_JEXEC') or die('Restricted access');

?>
<table border="0">
	<tr><td>Company</td><td><?php echo $this->data['enquiry___company']?></td></tr>
	<tr><td>Contact</td><td><?php echo $this->data['enquiry___contact']?></td></tr>
	<tr><td>Phone</td><td><?php echo $this->data['enquiry___phone']?></td></tr>
	<tr><td>Fax</td><td><?php echo $this->data['enquiry___fax']?></td></tr>
	<tr><td>Email</td><td><?php echo $this->data['enquiry___email']?></td></tr>
	<tr><td>Delivery details</td><td><?php echo $this->data['enquiry___delivery_details']?></td></tr>
	<tr><td>Fax</td><td><?php echo $this->data['enquiry___fax']?></td></tr>

	<tr><td>Quantity</td><td><?php echo $this->data['enquiry___quantity']?></td></tr>
	<tr><td>Colour</td><td><?php echo $this->data['enquiry___colour']?></td></tr>
	<tr><td>Number of colours</td><td><?php echo $this->data['enquiry___number_of_colours']?></td></tr>
	<tr><td>Colour 1</td><td><?php echo $color1?></td></tr>
	<tr><td>Colour 2</td><td><?php echo $color2?></td></tr>
	<tr><td>Colour 3</td><td><?php echo $color3?></td></tr>

	<tr><td>Layout</td><td><?php echo $this->data['enquiry___Balloon_Layout']?></td></tr>
	<tr><td>Direction</td><td><?php echo $this->data['enquiry___artwork']?></td></tr>
	<tr><td>Date required</td><td><?php echo $this->data['enquiry___date_required']?></td></tr>
	<tr><td>Accessories</td><td><?php echo $this->data['enquiry___accesories']?></td></tr>
	<tr><td>ref</td><td><?php echo $this->data['enquiry___id']?></td></tr>


</table>
