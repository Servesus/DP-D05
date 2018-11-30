
package service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import services.ComplaintService;
import services.CustomerService;
import services.FixUpTaskService;
import utilities.AbstractTest;
import domain.Complaint;
import domain.Customer;
import domain.FixUpTask;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/datasource.xml", "classpath:spring/config/packages.xml"
})
@Transactional
public class ComplaintServiceTest extends AbstractTest {

	private ComplaintService	complaintService;
	private CustomerService		customerService;
	private FixUpTaskService	fixUpTaskService;


	@Test
	public void testCreateComplaint() {

		final Complaint result = this.complaintService.create(2696);
		result.setDescription("");
		Assert.isTrue(result.getTicker().equals(this.complaintService.findOne(result.getId()).getTicker()) && result.getMoment().equals(this.complaintService.findOne(result.getId()).getMoment())
			&& result.getDescription().equals(this.complaintService.findOne(result.getId()).getDescription()) && result.getCustomer().equals(this.complaintService.findOne(result.getId()).getCustomer())
			&& result.getFixUpTasks().equals(this.complaintService.findOne(result.getId()).getFixUpTasks()));

	}
	@Test
	public void testFindOneComplaint() {

		final Customer ejemplo1 = this.customerService.findOne(2622);
		final FixUpTask ejemplo = this.fixUpTaskService.findOne(2696);
		final Complaint result = this.complaintService.findOne(2715);
		Assert.isTrue(result.getTicker() == "103778-j9t643" && result.getDescription() == "esta es la descripcion de complaint1" && result.getCustomer().equals(ejemplo1) && result.getFixUpTasks().equals(ejemplo));

	}
	@Test
	public void testFindAllComplaint() {

		Integer comparador = 0;
		final Complaint[] metodo = (Complaint[]) this.complaintService.findAll().toArray();
		final FixUpTask[] apoyo = (FixUpTask[]) this.fixUpTaskService.findAll().toArray();
		for (int i = 0; i < apoyo.length; i++)
			comparador += apoyo[i].getComplaints().size();
		Assert.isTrue(metodo.length == comparador);

	}
	@Test
	public void testSaveComplaint() {

	}
}
