<?php

/**
 * Class Table
 */
class Table
{
    /**
     * @var array
     */
    private $items;

    /**
     * Table constructor.
     *
     * @param array $items
     */
    public function __construct($items)
    {
        $this->items = $items;
    }

    /**
     * @return string
     */
    public function __toString()
    {
        return $this->build();
    }

    /**
     * @return string
     */
    public function build()
    {
        $html = '';

        $html .= '<table class="table table-bordered">';
        $html .= '<thead>';
        $html .= '<tr class="table-primary">';

        foreach (array_keys(isset($this->items[0]) ? $this->items[0] : []) as $name) {
            $html .= '<th>';
            $html .= $name;
            $html .= '</th>';
        }

        foreach ($this->items as $values) {
            $html .= '<tr>';

            foreach ($values as $value) {
                $html .= '<td>';
                $html .= $value;
                $html .= '</td>';
            }

            $html .= '</tr>';
        }

        $html .= '</tr>';
        $html .= '</thead>';
        $html .= '<tbody>';
        $html .= '</tbody>';
        $html .= '</table>';

        return $html;
    }
}
