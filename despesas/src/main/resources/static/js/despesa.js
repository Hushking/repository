/**
 * Baseado no exemplo de javascript de modal do BootStrap
 * acesse: http://getbootstrap.com/javascript/#modals-related-target 
 */
$('#confirmaRemocaoModal').on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget);
	
	var codigo = button.data('whatever');
	
	var modal = $(this);
	var form = modal.find('form');
	var action = form.attr('action');
	
	action = '/despesas/';
	form.attr('action', action + codigo);
	
	modal.find('.modal-body span').html('Tem certeza que deseja excluir a despesa <strong>' + codigo + '</strong>?');
});
	$(function(){
		
	$('.javascript-moeda').maskMoney({decimal: ',', thousands: '.', allowZero:true})
	
	});
	