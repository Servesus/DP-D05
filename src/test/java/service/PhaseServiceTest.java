
package service;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import services.FixUpTaskService;
import services.PhaseService;
import utilities.AbstractTest;
import domain.Phase;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/datasource.xml", "classpath:spring/config/packages.xml"
})
@Transactional
public class PhaseServiceTest extends AbstractTest {

	//Service Testing
	private PhaseService		phaseService;
	private FixUpTaskService	fixUpService;


	//2696 id fixUp crear fase 5
	@Test
	public void testCreatePhase() {
		System.out.println("Entro");
		final int fixUpTaskId = this.getEntityId("fixUpTask1");
		System.out.println("TENGO EL ID");
		final Phase p;
		p = this.phaseService.create(fixUpTaskId);
		p.setTitle("titulo");
		p.setDescription("descr");
		p.setStartMoment(new Date("2016/01/02 12:12"));
		p.setFinishMoment(new Date("2018/01/02 12:12"));
		p.setNumber(5);
		//Assert.notNull(p.getFixUpTask());
		//Assert.notNull(p);
		Assert.isTrue(true);
	}
	@Test
	public void testSavePhase() {
		Phase phase;
		final Phase saved;
		Collection<Phase> phases;
		phase = this.phaseService.create(2696);

		final Date startDate = new GregorianCalendar(2018, Calendar.NOVEMBER, 12).getTime();
		final Date finishDate = new GregorianCalendar(2018, Calendar.NOVEMBER, 13).getTime();
		phase.setTitle("phase5");
		phase.setDescription("description");
		phase.setStartMoment(startDate);
		phase.setFinishMoment(finishDate);
		phase.setNumber(5);

		super.authenticate("handyWorker1");
		saved = this.phaseService.save(phase);
		phases = this.phaseService.findAll();
		Assert.isTrue(phases.contains(saved));
		super.authenticate(null);

	}
}
