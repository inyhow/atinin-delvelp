<?php

require FCPATH.'dayrui/core/D_Form.php';

class Form_zhuce extends D_Form {

	public function __construct() {
		parent::__construct();
	}

	public function add() {
		$this->_addc();
	}

	public function edit() {
		$this->_editc();
	}

	public function index() {
		$this->_listc();
	}

}