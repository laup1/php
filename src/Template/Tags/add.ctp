<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Tag $tag
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('List Tags'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Agencies'), ['controller' => 'Agencies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Agency'), ['controller' => 'Agencies', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="tags form large-9 medium-8 columns content">
    <?= $this->Form->create($tag) ?>
    <fieldset>
        <legend><?= __('Add Tag') ?></legend>
        <?php
            echo $this->Form->control('title');
            echo $this->Form->control('agencies._ids', ['options' => $agencies]);
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>