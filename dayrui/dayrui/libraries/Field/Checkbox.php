<?php

/**
 * Dayrui Website Management System
 *
 * @since		version 2.0.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

class F_Checkbox extends A_Field {
	
	/**
     * 构造函数
     */
    public function __construct() {
		parent::__construct();
		$this->name = IS_ADMIN ? fc_lang('复选框') : ''; // 字段名称
		$this->fieldtype = TRUE; // TRUE表全部可用字段类型,自定义格式为 array('可用字段类型名称' => '默认长度', ... )
		$this->defaulttype = 'VARCHAR'; // 当用户没有选择字段类型时的缺省值
    }
	
	/**
	 * 字段相关属性参数
	 *
	 * @param	array	$value	值
	 * @return  string
	 */
	public function option($option) {
	
		$option['value'] = isset($option['value']) ? $option['value'] : '';
		$option['options'] = isset($option['options']) ? $option['options'] : 'name1|value1'.PHP_EOL.'name2|value2';
		$option['fieldtype'] = isset($option['fieldtype']) ? $option['fieldtype'] : '';
		$option['fieldlength'] = isset($option['fieldlength']) ? $option['fieldlength'] : '';
		
		return '
			<div class="form-group">
				<label class="col-md-2 control-label">'.fc_lang('选项列表').'：</label>
				<div class="col-md-9">
					<textarea class="form-control" name="data[setting][option][options]" style="height:150px;width:400px;">'.$option['options'].'</textarea>
					<span class="help-block">'.fc_lang('格式：选项名称|选项值[回车换行]选项名称2|值2....').'</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">'.fc_lang('默认选中选项').'：</label>
				<div class="col-md-9">
					<label><input id="field_default_value" type="text" class="form-control" size="20" value="'.$option['value'].'" name="data[setting][option][value]"></label>
					<label>'.$this->member_field_select().'</label>
					<span class="help-block">'.fc_lang('默认选中项，多个选中项用|分隔').'</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">'.fc_lang('友情提示').'：</label>
				<div class="col-md-9" style="color:blue"> <div class="form-control-static">'.fc_lang('此字段不能参与搜索条件筛选').'</div></div>
			</div>';
	}
	
	/**
	 * 字段入库值
	 */
	public function insert_value($field) {
		$this->ci->data[$field['ismain']][$field['fieldname']] = dr_array2string($this->ci->post[$field['fieldname']]);
	}
	
	/**
	 * 字段入库值
	 */
	public function output($value) {
		return dr_string2array($value);
	}
	
	/**
	 * 字段表单输入
	 *
	 * @param	string	$cname	字段别名
	 * @param	string	$name	字段名称
	 * @param	array	$cfg	字段配置
	 * @param	string	$value	值
	 * @return  string
	 */
	public function input($cname, $name, $cfg, $value = NULL, $id = 0) {
		// 字段显示名称
		$text = (isset($cfg['validate']['required']) && $cfg['validate']['required'] == 1 ? '<font color="red">*</font>' : '').'&nbsp;'.$cname.'：';
		// 表单附加参数
		$attr = isset($cfg['validate']['formattr']) && $cfg['validate']['formattr'] ? $cfg['validate']['formattr'] : '';
		// 字段提示信息
		$tips = isset($cfg['validate']['tips']) && $cfg['validate']['tips'] ? '<div class="onShow" id="dr_'.$name.'_tips">'.$cfg['validate']['tips'].'</div>' : '';
		// 字段默认值
		if ($value) {
			$value = dr_string2array($value);
		} elseif ($cfg['option']['value']) {
			$value = $this->get_default_value($cfg['option']['value']);
			$value = is_array($value) ? $value : @explode('|', $value);
		} else {
			$value = NULL;
		}
        $str = '';
		// 禁止修改
		if (!IS_ADMIN && $id
            && $value && isset($cfg['validate']['isedit'])
            && $cfg['validate']['isedit']) {
            $attr.= ' disabled';
        }
		// 表单选项
		$options = isset($cfg['option']['options']) && $cfg['option']['options'] ? $cfg['option']['options'] : '';
		if ($options) {
			$options = explode(PHP_EOL, str_replace(array(chr(13), chr(10)), PHP_EOL, $options));
			foreach ($options as $t) {
				if ($t) {
					$n = $v = $selected = '';
                    if (strpos($t, '|') !== FALSE) {
                        list($n, $v) = explode('|', $t);
                        $v = is_null($v) || !strlen($v) ? '' : trim($v);
                    } else {
                        $v = $n = trim($t);
                    }
					$selected = is_array($value) && in_array($v, $value) ? ' checked' : '';
					$kj = '<input type="checkbox" name="data['.$name.'][]" value="'.$v.'" ' . $selected . ' '.$attr.' />';
					$str.= '<label class="checkbox-inline">'.$kj.' '.$n.' </label>';
				}
			}
		}
		$str.= $tips;
		return $this->input_format($name, $text, '<div class="checkbox-list">'.$str.'</div>');
	}
	
}